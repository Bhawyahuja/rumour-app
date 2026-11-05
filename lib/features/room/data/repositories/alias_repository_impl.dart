import 'package:rumour/core/constants/app_constants.dart';
import 'package:rumour/core/error/error_mapper.dart';
import 'package:rumour/core/error/exceptions.dart';
import 'package:rumour/core/utils/result.dart';
import 'package:rumour/features/room/data/datasources/random_user_remote_data_source.dart';
import 'package:rumour/features/room/data/datasources/room_remote_data_source.dart';
import 'package:rumour/features/room/data/dtos/random_user_dto.dart';
import 'package:rumour/features/room/domain/entities/alias.dart';
import 'package:rumour/features/room/domain/repositories/alias_repository.dart';

class AliasRepositoryImpl implements AliasRepository {
  const AliasRepositoryImpl({
    required RandomUserRemoteDataSource remote,
    required RoomRemoteDataSource rooms,
  }) : _remote = remote,
       _rooms = rooms;

  final RandomUserRemoteDataSource _remote;
  final RoomRemoteDataSource _rooms;

  @override
  Future<Result<Alias>> generateAlias({required String roomCode}) async {
    try {
      Alias? candidate;
      for (var i = 0; i < AppConstants.aliasMaxAttempts; i++) {
        candidate = toAlias(await _remote.fetchRandomUser());
        final taken = await _rooms.isAliasTaken(
          code: roomCode,
          alias: candidate.displayName,
        );
        if (!taken) return Ok(candidate);
      }
      // Extremely unlikely: every attempt collided. Still return a name —
      // the member document is keyed by user id so duplicates are harmless.
      return Ok(candidate!);
    } catch (e) {
      return Err(ErrorMapper.toFailure(e));
    }
  }

  /// DTO → domain mapping. Exposed for tests.
  static Alias toAlias(RandomUserDto dto) {
    final first = dto.name.first.trim();
    final last = dto.name.last.trim();
    if (first.isEmpty || last.isEmpty) throw const ParsingException();
    return Alias(firstName: first, lastName: last);
  }
}
