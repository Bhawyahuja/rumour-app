import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rumour/core/utils/firestore_converters.dart';
import 'package:rumour/features/room/domain/entities/member.dart';


part 'member_dto.freezed.dart';
part 'member_dto.g.dart';

/// Firestore document: `rooms/{code}/members/{userId}`.
@freezed
abstract class MemberDto with _$MemberDto {
  const MemberDto._();

  const factory MemberDto({
    required String userId,
    required String alias,
    required String handle,
    @TimestampConverter() DateTime? joinedAt,
  }) = _MemberDto;

  factory MemberDto.fromJson(Map<String, dynamic> json) =>
      _$MemberDtoFromJson(json);

  Member toEntity(String roomCode) => Member(
        userId: userId,
        roomCode: roomCode,
        alias: alias,
        joinedAt: joinedAt,
      );
}
