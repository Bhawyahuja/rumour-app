import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/core/services/app_lifecycle_service.dart';
import 'package:rumour/core/services/clipboard_service.dart';
import 'package:rumour/core/services/notification_service.dart';
import 'package:rumour/core/utils/result.dart';
import 'package:rumour/features/chat/domain/entities/message.dart';
import 'package:rumour/features/chat/domain/entities/message_window.dart';
import 'package:rumour/features/chat/domain/repositories/chat_repository.dart';
import 'package:rumour/features/chat/presentation/models/chat_item.dart';
import 'package:rumour/features/chat/presentation/models/chat_items_builder.dart';
import 'package:rumour/features/room/domain/entities/member.dart';


part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({
    required this.member,
    required ChatRepository chat,
    required NotificationService notifications,
    required AppLifecycleService lifecycle,
    required ClipboardService clipboard,
    this.offlineDebounce = const Duration(milliseconds: 1500),
  })  : _chat = chat,
        _notifications = notifications,
        _lifecycle = lifecycle,
        _clipboard = clipboard,
        super(const ChatState());

  final Member member;
  final ChatRepository _chat;
  final NotificationService _notifications;
  final AppLifecycleService _lifecycle;
  final ClipboardService _clipboard;

  /// How long the cache must be stale before showing the offline banner
  /// (avoids flashing it during the normal initial sync).
  final Duration offlineDebounce;

  /// Distance (px) from the oldest end that triggers loading history.
  static const double loadMoreThreshold = 320;

  /// Distance (px) from the newest end still considered "at the bottom".
  static const double atLatestThreshold = 80;

  StreamSubscription<Result<MessageWindow>>? _sub;
  Timer? _offlineTimer;
  Timer? _animationResetTimer;

  /// Live window from the stream and older pages fetched on demand.
  List<Message> _latest = const [];
  List<Message> _older = const [];

  /// Ids already seen — used to detect genuinely new messages.
  final Set<String> _seen = {};

  /// Ids that arrived live and should animate in once.
  final Set<String> _animated = {};

  bool _hasInitialSnapshot = false;
  bool _viewingLatest = true;

  String get roomCode => member.roomCode;

  // ── Lifecycle ───────────────────────────────────────────────────────────

  Future<void> start() async {
    await _sub?.cancel();
    emit(state.copyWith(status: ChatStatus.loading, failure: null));
    _sub = _chat.watchLatestMessages(roomCode).listen(_onWindow);
    unawaited(_notifications.requestPermission());
  }

  @override
  Future<void> close() async {
    _offlineTimer?.cancel();
    _animationResetTimer?.cancel();
    await _sub?.cancel();
    return super.close();
  }

  // ── User intents ────────────────────────────────────────────────────────

  /// Sends [text]. It appears immediately through Firestore latency
  /// compensation (marked pending); we only surface failures.
  Future<void> send(String text) async {
    if (text.trim().isEmpty) return;
    emit(state.copyWith(scrollToLatestTick: state.scrollToLatestTick + 1));
    final result = await _chat.sendMessage(
      roomCode: roomCode,
      senderAlias: member.alias,
      text: text,
    );
    if (isClosed) return;
    if (result case Err(:final failure)) {
      _notice(ChatNotice.failure(failure));
    }
  }

  Future<void> copyMessage(Message message) async {
    try {
      await _clipboard.copy(message.text);
      _notice(const ChatNotice.copied());
    } catch (_) {
      _notice(const ChatNotice.copyFailed());
    }
  }

  /// Reports the scroll position of the reversed list
  /// (0 = newest message, [maxExtent] = oldest loaded message).
  void onScroll({required double offset, required double maxExtent}) {
    final atLatest = offset <= atLatestThreshold;
    if (atLatest != _viewingLatest) {
      _viewingLatest = atLatest;
      if (atLatest && state.unreadCount > 0) {
        emit(state.copyWith(unreadCount: 0));
      }
    }
    if (maxExtent - offset <= loadMoreThreshold) unawaited(loadMore());
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore || state.messages.isEmpty) {
      return;
    }
    emit(state.copyWith(isLoadingMore: true));

    final oldest = state.messages.last.createdAt;
    final result = await _chat.fetchOlderMessages(roomCode, before: oldest);
    if (isClosed) return;

    switch (result) {
      case Ok(:final value):
        _older = _dedupe([..._older, ...value]);
        _seen.addAll(value.map((m) => m.id));
        _emitMessages(
          state.copyWith(
            isLoadingMore: false,
            hasMore: value.length >= _chat.pageSize,
          ),
        );
      case Err(:final failure):
        emit(state.copyWith(isLoadingMore: false));
        _notice(ChatNotice.failure(failure));
    }
  }

  // ── Stream handling ─────────────────────────────────────────────────────

  void _onWindow(Result<MessageWindow> result) {
    switch (result) {
      case Ok(:final value):
        _applyWindow(value);
      case Err(:final failure):
        if (state.status == ChatStatus.ready) {
          _notice(ChatNotice.failure(failure));
        } else {
          emit(state.copyWith(status: ChatStatus.failure, failure: failure));
        }
    }
  }

  void _applyWindow(MessageWindow window) {
    final latest = window.messages;
    final latestIds = {for (final m in latest) m.id};

    // Messages pushed out of the live window move into history so the
    // conversation never shows a gap.
    final dropped = _latest.where((m) => !latestIds.contains(m.id));
    _older = _dedupe([...dropped, ..._older])
        .where((m) => !latestIds.contains(m.id))
        .toList(growable: false);
    _latest = latest;

    final incoming = _collectNew(latest);
    _notifyIfBackgrounded(incoming);
    _trackOffline(window.isFromCache);

    final wasReady = state.status == ChatStatus.ready;
    _emitMessages(
      state.copyWith(
        status: ChatStatus.ready,
        failure: null,
        hasMore: wasReady ? state.hasMore : latest.length >= _chat.pageSize,
        unreadCount: _viewingLatest
            ? 0
            : state.unreadCount + incoming.where((m) => !m.isMine).length,
      ),
    );
  }

  /// Returns messages not seen before (excluding the initial history).
  List<Message> _collectNew(List<Message> latest) {
    final fresh = latest
        .where((m) => !_seen.contains(m.id) && !m.isPending)
        .toList(growable: false);
    final pendingMine = latest.where(
      (m) => m.isPending && !_seen.contains(m.id) && !_animated.contains(m.id),
    );

    _seen.addAll(latest.where((m) => !m.isPending).map((m) => m.id));

    if (!_hasInitialSnapshot) {
      _hasInitialSnapshot = true;
      return const [];
    }

    _animated
      ..addAll(fresh.map((m) => m.id))
      ..addAll(pendingMine.map((m) => m.id));
    _scheduleAnimationReset();
    return fresh;
  }

  void _notifyIfBackgrounded(List<Message> incoming) {
    if (incoming.isEmpty || _lifecycle.isInForeground) return;
    final others = incoming.where((m) => !m.isMine).take(3).toList();
    for (final m in others.reversed) {
      unawaited(
        _notifications.showChatMessage(
          roomCode: roomCode,
          sender: m.senderHandle,
          text: m.text,
        ),
      );
    }
  }

  void _trackOffline(bool fromCache) {
    if (!fromCache) {
      _offlineTimer?.cancel();
      _offlineTimer = null;
      if (state.isOffline) emit(state.copyWith(isOffline: false));
      return;
    }
    _offlineTimer ??= Timer(offlineDebounce, () {
      if (!isClosed) emit(state.copyWith(isOffline: true));
    });
  }

  /// Animate-in flags only apply to the frame where a message appears;
  /// clearing them stops re-animating when a row is scrolled back into view.
  void _scheduleAnimationReset() {
    _animationResetTimer?.cancel();
    _animationResetTimer = Timer(const Duration(milliseconds: 700), () {
      if (isClosed || _animated.isEmpty) return;
      _animated.clear();
      _emitMessages(state);
    });
  }

  // ── Helpers ─────────────────────────────────────────────────────────────

  void _emitMessages(ChatState base) {
    final merged = _merged();
    emit(
      base.copyWith(
        messages: merged,
        items: ChatItemsBuilder.build(merged, animatedIds: _animated),
      ),
    );
  }

  void _notice(ChatNotice notice) => emit(
        state.copyWith(notice: notice, noticeId: state.noticeId + 1),
      );

  List<Message> _merged() {
    final ids = {for (final m in _latest) m.id};
    final all = [
      ..._latest,
      ..._older.where((m) => !ids.contains(m.id)),
    ]..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return List.unmodifiable(all);
  }

  static List<Message> _dedupe(List<Message> items) {
    final seen = <String>{};
    return [
      for (final m in items)
        if (seen.add(m.id)) m,
    ];
  }
}
