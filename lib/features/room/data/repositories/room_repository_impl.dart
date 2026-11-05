import 'dart:async';

import 'package:rumour/core/error/error_mapper.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/core/utils/result.dart';
import 'package:rumour/features/room/data/datasources/room_remote_data_source.dart';
import 'package:rumour/features/room/domain/entities/member.dart';
import 'package:rumour/features/room/domain/entities/room.dart';
import 'package:rumour/features/room/domain/repositories/room_repository.dart';
import 'package:rumour/features/room/domain/room_code.dart';
import 'package:rumour/features/user/domain/repositories/user_repository.dart';



class RoomRepositoryImpl implements RoomRepository {
  const RoomRepositoryImpl(this._remote, this._users);

  final RoomRemoteDataSource _remote;
  final UserRepository _users;

  @override
  Stream<Result<Room>> watchRoom(String code) {
    return _remote
        .watchRoom(code)
        .map<Result<Room>>(
          (dto) => Ok(dto?.toEntity() ?? Room.empty(code)),
        )
        .transform(
          StreamTransformer<Result<Room>, Result<Room>>.fromHandlers(
            handleError: (error, _, sink) =>
                sink.add(Err(ErrorMapper.toFailure(error))),
          ),
        );
  }

  @override
  Future<Result<Member?>> findMembership(String code) async {
    if (!RoomCode.isValid(code)) return const Err(_invalidCode);
    try {
      final dto = await _remote.getMember(
        code: code,
        userId: _users.currentUserId,
      );
      return Ok(dto?.toEntity(code));
    } catch (e) {
      return Err(ErrorMapper.toFailure(e));
    }
  }

  @override
  Future<Result<Member>> joinRoom({
    required String code,
    required String alias,
    required String handle,
  }) async {
    if (!RoomCode.isValid(code)) return const Err(_invalidCode);
    try {
      final dto = await _remote.joinRoom(
        code: code,
        userId: _users.currentUserId,
        alias: alias,
        handle: handle,
      );
      return Ok(dto.toEntity(code));
    } catch (e) {
      return Err(ErrorMapper.toFailure(e));
    }
  }

  static const Failure _invalidCode =
      Failure.validation(reason: ValidationReason.invalidRoomCode);
}
