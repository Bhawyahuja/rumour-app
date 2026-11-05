import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/core/utils/result.dart';
import 'package:rumour/features/chat/domain/entities/message.dart';
import 'package:rumour/features/chat/domain/entities/message_window.dart';
import 'package:rumour/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rumour/features/chat/presentation/models/chat_item.dart';
import 'package:rumour/features/room/domain/entities/member.dart';

import '../../helpers/mocks.dart';

void main() {
  late MockChatRepository chat;
  late MockNotificationService notifications;
  late MockAppLifecycleService lifecycle;
  late MockClipboardService clipboard;
  late StreamController<Result<MessageWindow>> stream;

  const me = Member(userId: 'me', roomCode: '123456', alias: 'Brave Badger');

  Message msg(String id, {String sender = 'other', int minutesAgo = 0}) =>
      Message(
        id: id,
        text: 'text $id',
        senderId: sender,
        senderAlias: 'Pink Panther',
        createdAt: DateTime(2026, 1, 1, 12).subtract(Duration(minutes: minutesAgo)),
        isMine: sender == 'me',
      );

  setUp(() {
    chat = MockChatRepository();
    notifications = MockNotificationService();
    lifecycle = MockAppLifecycleService();
    clipboard = MockClipboardService();
    stream = StreamController<Result<MessageWindow>>();

    when(() => chat.pageSize).thenReturn(2);
    when(() => chat.watchLatestMessages('123456'))
        .thenAnswer((_) => stream.stream);
    when(() => notifications.requestPermission()).thenAnswer((_) async => true);
    when(
      () => notifications.showChatMessage(
        roomCode: any(named: 'roomCode'),
        sender: any(named: 'sender'),
        text: any(named: 'text'),
      ),
    ).thenAnswer((_) async {});
  });

  tearDown(() => stream.close());

  ChatCubit build() => ChatCubit(
        member: me,
        chat: chat,
        notifications: notifications,
        lifecycle: lifecycle,
        clipboard: clipboard,
        offlineDebounce: const Duration(milliseconds: 10),
      );

  Result<MessageWindow> window(List<Message> messages, {bool cache = false}) =>
      Ok(MessageWindow(messages: messages, isFromCache: cache));

  test('first snapshot moves to ready and never notifies', () async {
    when(() => lifecycle.isInForeground).thenReturn(false);
    final cubit = build();
    await cubit.start();

    stream.add(window([msg('b'), msg('a', minutesAgo: 1)]));
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.status, ChatStatus.ready);
    expect(cubit.state.messages.map((m) => m.id), ['b', 'a']);
    expect(cubit.state.hasMore, isTrue);
    verifyNever(
      () => notifications.showChatMessage(
        roomCode: any(named: 'roomCode'),
        sender: any(named: 'sender'),
        text: any(named: 'text'),
      ),
    );
    await cubit.close();
  });

  test('notifies about new incoming messages while backgrounded', () async {
    when(() => lifecycle.isInForeground).thenReturn(false);
    final cubit = build();
    await cubit.start();

    stream.add(window([msg('a', minutesAgo: 1)]));
    await Future<void>.delayed(Duration.zero);
    stream.add(window([msg('c', sender: 'me'), msg('b'), msg('a', minutesAgo: 1)]));
    await Future<void>.delayed(Duration.zero);

    verify(
      () => notifications.showChatMessage(
        roomCode: '123456',
        sender: 'PinkPanther',
        text: 'text b',
      ),
    ).called(1);
    await cubit.close();
  });

  test('messages pushed out of the live window are kept', () async {
    when(() => lifecycle.isInForeground).thenReturn(true);
    final cubit = build();
    await cubit.start();

    stream.add(window([msg('b'), msg('a', minutesAgo: 1)]));
    await Future<void>.delayed(Duration.zero);
    stream.add(window([msg('c'), msg('b')]));
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.messages.map((m) => m.id), ['c', 'b', 'a']);
    await cubit.close();
  });

  test('stream error before first data → failure status', () async {
    when(() => lifecycle.isInForeground).thenReturn(true);
    final cubit = build();
    await cubit.start();

    stream.add(const Err(Failure.permissionDenied()));
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.status, ChatStatus.failure);
    await cubit.close();
  });

  test('builds render items with day separator on top', () async {
    when(() => lifecycle.isInForeground).thenReturn(true);
    final cubit = build();
    await cubit.start();

    stream.add(window([msg('b'), msg('a', minutesAgo: 1)]));
    await Future<void>.delayed(Duration.zero);

    final items = cubit.state.items;
    expect(items, hasLength(3));
    expect(items.last, isA<ChatDaySeparator>());
    expect((items[1] as ChatMessageItem).showSender, isTrue);
    expect((items[0] as ChatMessageItem).showSender, isFalse);
    await cubit.close();
  });

  test('counts unread messages while scrolled away and resets at bottom',
      () async {
    when(() => lifecycle.isInForeground).thenReturn(true);
    final cubit = build();
    await cubit.start();

    stream.add(window([msg('a', minutesAgo: 1)]));
    await Future<void>.delayed(Duration.zero);
    cubit.onScroll(offset: 900, maxExtent: 5000);
    stream.add(window([msg('b'), msg('a', minutesAgo: 1)]));
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.unreadCount, 1);
    cubit.onScroll(offset: 0, maxExtent: 5000);
    expect(cubit.state.unreadCount, 0);
    await cubit.close();
  });

  test('shows offline only after the cache stays stale', () async {
    when(() => lifecycle.isInForeground).thenReturn(true);
    final cubit = build();
    await cubit.start();

    stream.add(window([msg('a')], cache: true));
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.isOffline, isFalse);
    await Future<void>.delayed(const Duration(milliseconds: 30));
    expect(cubit.state.isOffline, isTrue);

    stream.add(window([msg('a')]));
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.isOffline, isFalse);
    await cubit.close();
  });

  test('copyMessage copies text and emits a success notice', () async {
    when(() => clipboard.copy(any())).thenAnswer((_) async {});
    final cubit = build();

    await cubit.copyMessage(msg('a'));

    verify(() => clipboard.copy('text a')).called(1);
    expect(cubit.state.notice, const ChatNotice.copied());
    await cubit.close();
  });
}
