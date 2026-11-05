import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rumour/features/chat/domain/entities/message.dart';

part 'chat_item.freezed.dart';

@freezed
sealed class ChatItem with _$ChatItem {
  const factory ChatItem.daySeparator({
    required String id,

    required DateTime day,

    @Default(false) bool isTopMost,
  }) = ChatDaySeparator;

  const factory ChatItem.message({
    required Message message,

    required bool showSender,

    required double topSpacing,

    @Default(false) bool animateIn,
  }) = ChatMessageItem;
}

extension ChatItemKey on ChatItem {
  String get key => switch (this) {
    ChatDaySeparator(:final id) => 'day_$id',
    ChatMessageItem(:final message) => message.id,
  };
}
