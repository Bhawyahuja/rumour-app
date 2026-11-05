import '../../../../core/utils/date_formatter.dart';
import '../../domain/entities/message.dart';
import 'chat_item.dart';

/// Turns a newest-first message list into rows for a `reverse: true` list.
///
/// Because the list is reversed, a day separator is emitted *after* the
/// oldest message of its day so it renders visually above that day.
abstract final class ChatItemsBuilder {
  static const double senderGap = 16;
  static const double groupedGap = 4;

  static List<ChatItem> build(
    List<Message> newestFirst, {
    Set<String> animatedIds = const {},
  }) {
    final items = <ChatItem>[];
    for (var i = 0; i < newestFirst.length; i++) {
      final message = newestFirst[i];
      final older = i + 1 < newestFirst.length ? newestFirst[i + 1] : null;

      final startsDay =
          older == null ||
          !DateFormatter.isSameDay(older.createdAt, message.createdAt);
      final startsRun = startsDay || older.senderId != message.senderId;

      items.add(
        ChatItem.message(
          message: message,
          showSender: startsRun,
          topSpacing: startsDay ? 0 : (startsRun ? senderGap : groupedGap),
          animateIn: animatedIds.contains(message.id),
        ),
      );

      if (startsDay) {
        final local = message.createdAt.toLocal();
        items.add(
          ChatItem.daySeparator(
            id: '${local.year}-${local.month}-${local.day}',
            day: DateFormatter.dayOnly(local),
            isTopMost: older == null,
          ),
        );
      }
    }
    return List.unmodifiable(items);
  }
}
