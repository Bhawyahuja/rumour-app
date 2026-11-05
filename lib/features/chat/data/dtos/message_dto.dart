import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rumour/core/utils/firestore_converters.dart';
import 'package:rumour/features/chat/domain/entities/message.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
abstract class MessageDto with _$MessageDto {
  const MessageDto._();

  const factory MessageDto({
    @JsonKey(includeToJson: false) @Default('') String id,
    required String text,
    required String senderId,
    required String senderAlias,

    /// Server timestamp — `null` while the write is still pending locally.
    @TimestampConverter() DateTime? createdAt,

    /// Device timestamp, used for ordering/display until [createdAt] lands.
    @TimestampConverter() DateTime? clientCreatedAt,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);

  Message toEntity({required String currentUserId, bool isPending = false}) =>
      Message(
        id: id,
        text: text,
        senderId: senderId,
        senderAlias: senderAlias,
        createdAt: createdAt ?? clientCreatedAt ?? DateTime.now(),
        isMine: senderId == currentUserId,
        isPending: isPending,
      );
}
