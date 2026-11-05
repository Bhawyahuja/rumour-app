// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) => _MessageDto(
  id: json['id'] as String? ?? '',
  text: json['text'] as String,
  senderId: json['senderId'] as String,
  senderAlias: json['senderAlias'] as String,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  clientCreatedAt: const TimestampConverter().fromJson(json['clientCreatedAt']),
);

Map<String, dynamic> _$MessageDtoToJson(_MessageDto instance) =>
    <String, dynamic>{
      'text': instance.text,
      'senderId': instance.senderId,
      'senderAlias': instance.senderAlias,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'clientCreatedAt': const TimestampConverter().toJson(
        instance.clientCreatedAt,
      ),
    };
