// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomDto _$RoomDtoFromJson(Map<String, dynamic> json) => _RoomDto(
  code: json['code'] as String,
  memberCount: (json['memberCount'] as num?)?.toInt() ?? 0,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  lastMessageAt: const TimestampConverter().fromJson(json['lastMessageAt']),
);

Map<String, dynamic> _$RoomDtoToJson(_RoomDto instance) => <String, dynamic>{
  'code': instance.code,
  'memberCount': instance.memberCount,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'lastMessageAt': const TimestampConverter().toJson(instance.lastMessageAt),
};
