part of 'chat_cubit.dart';

enum ChatStatus { loading, ready, failure }

/// One-off feedback shown as a snackbar; localized by the UI.
@freezed
sealed class ChatNotice with _$ChatNotice {
  const factory ChatNotice.copied() = ChatNoticeCopied;
  const factory ChatNotice.copyFailed() = ChatNoticeCopyFailed;
  const factory ChatNotice.failure(Failure failure) = ChatNoticeFailure;
}

@freezed
abstract class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState({
    @Default(ChatStatus.loading) ChatStatus status,

    /// Newest first (source of truth for pagination).
    @Default(<Message>[]) List<Message> messages,

    /// Render-ready rows derived from [messages].
    @Default(<ChatItem>[]) List<ChatItem> items,
    @Default(false) bool hasMore,
    @Default(false) bool isLoadingMore,

    /// Not synced with the server for a while (debounced).
    @Default(false) bool isOffline,

    /// New incoming messages received while scrolled away from the bottom.
    @Default(0) int unreadCount,

    /// Bumped when the list should jump to the newest message.
    @Default(0) int scrollToLatestTick,

    /// Blocking error for the initial load.
    Failure? failure,

    /// One-off feedback; [noticeId] changes every time so repeats still show.
    ChatNotice? notice,
    @Default(0) int noticeId,
  }) = _ChatState;

  bool get isEmpty => status == ChatStatus.ready && messages.isEmpty;
}
