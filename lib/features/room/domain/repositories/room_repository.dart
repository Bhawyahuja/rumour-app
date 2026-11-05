import '../../../../core/utils/result.dart';
import '../entities/member.dart';
import '../entities/room.dart';

abstract interface class RoomRepository {
  /// Live room info (member count etc.). Emits [Room.empty] while the room
  /// document does not exist yet.
  Stream<Result<Room>> watchRoom(String code);

  /// The current user's membership in [code], or `null` if not joined yet.
  Future<Result<Member?>> findMembership(String code);

  /// Joins (creating the room if necessary) using the acknowledged [alias].
  Future<Result<Member>> joinRoom({
    required String code,
    required String alias,
    required String handle,
  });
}
