// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberDto _$MemberDtoFromJson(Map<String, dynamic> json) => _MemberDto(
  userId: json['userId'] as String,
  alias: json['alias'] as String,
  handle: json['handle'] as String,
  joinedAt: const TimestampConverter().fromJson(json['joinedAt']),
);

Map<String, dynamic> _$MemberDtoToJson(_MemberDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'alias': instance.alias,
      'handle': instance.handle,
      'joinedAt': const TimestampConverter().toJson(instance.joinedAt),
    };
