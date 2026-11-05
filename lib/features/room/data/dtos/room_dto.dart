import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rumour/core/utils/firestore_converters.dart';
import 'package:rumour/features/room/domain/entities/room.dart';



part 'room_dto.freezed.dart';
part 'room_dto.g.dart';

/// Firestore document: `rooms/{code}`.
@freezed
abstract class RoomDto with _$RoomDto {
  const RoomDto._();

  const factory RoomDto({
    required String code,
    @Default(0) int memberCount,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? lastMessageAt,
  }) = _RoomDto;

  factory RoomDto.fromJson(Map<String, dynamic> json) =>
      _$RoomDtoFromJson(json);

  Room toEntity() => Room(
        code: code,
        memberCount: memberCount,
        createdAt: createdAt,
        lastMessageAt: lastMessageAt,
      );
}
