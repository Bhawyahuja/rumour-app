import 'package:flutter_test/flutter_test.dart';
import 'package:rumour/features/chat/domain/entities/message.dart';
import 'package:rumour/features/chat/presentation/models/chat_item.dart';
import 'package:rumour/features/chat/presentation/models/chat_items_builder.dart';

void main() {
  Message msg(String id, String sender, DateTime at) => Message(
        id: id,
        text: id,
        senderId: sender,
        senderAlias: sender,
        createdAt: at,
      );

  test('groups runs, spaces senders and separates days (newest first)', () {
    final items = ChatItemsBuilder.build(
      [
        msg('d', 'bob', DateTime(2026, 11, 6, 10, 2)),
        msg('c', 'bob', DateTime(2026, 11, 6, 10, 1)),
        msg('b', 'amy', DateTime(2026, 11, 6, 10)),
        msg('a', 'amy', DateTime(2026, 11, 5, 9)),
      ],
      animatedIds: {'d'},
    );

    expect(items.map((i) => i.key), [
      'd',
      'c',
      'b',
      'day_2026-11-6',
      'a',
      'day_2026-11-5',
    ]);

    final d = items[0] as ChatMessageItem;
    final c = items[1] as ChatMessageItem;
    final b = items[2] as ChatMessageItem;
    expect(d.showSender, isFalse);
    expect(d.topSpacing, ChatItemsBuilder.groupedGap);
    expect(d.animateIn, isTrue);
    expect(c.showSender, isTrue);
    expect(c.topSpacing, ChatItemsBuilder.senderGap);
    expect(b.showSender, isTrue);
    expect(b.topSpacing, 0); // first of its day, below the chip

    expect((items[3] as ChatDaySeparator).day, DateTime(2026, 11, 6));
    expect((items[5] as ChatDaySeparator).day, DateTime(2026, 11, 5));
    expect((items[5] as ChatDaySeparator).isTopMost, isTrue);
    expect((items[3] as ChatDaySeparator).isTopMost, isFalse);
  });

  test('empty list → no items', () {
    expect(ChatItemsBuilder.build(const []), isEmpty);
  });
}
