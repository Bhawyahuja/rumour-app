import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';

@freezed
abstract class Room with _$Room {
  const Room._();

  const factory Room({
    required String code,
    @Default(0) int memberCount,
    DateTime? createdAt,
    DateTime? lastMessageAt,
  }) = _Room;

  /// Placeholder used before a room document exists in Firestore.
  factory Room.empty(String code) => Room(code: code);
}
