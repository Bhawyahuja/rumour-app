import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rumour/core/constants/app_constants.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/core/utils/result.dart';
import 'package:rumour/features/room/domain/entities/member.dart';
import 'package:rumour/features/room/domain/repositories/room_repository.dart';
import 'package:rumour/features/room/domain/room_code.dart';

part 'join_room_cubit.freezed.dart';
part 'join_room_state.dart';

class JoinRoomCubit extends Cubit<JoinRoomState> {
  JoinRoomCubit(this._rooms) : super(const JoinRoomState.idle());

  final RoomRepository _rooms;
  int _failures = 0;

  Future<void> codeChanged(String raw) async {
    final code = RoomCode.sanitize(raw);
    if (state is JoinRoomFailure && code.length < AppConstants.roomCodeLength) {
      emit(const JoinRoomState.idle());
    }
    if (code.length == AppConstants.roomCodeLength) await submit(code);
  }

  Future<void> submit(String rawCode) async {
    if (state.isChecking) return;

    final code = RoomCode.sanitize(rawCode);
    if (!RoomCode.isValid(code)) {
      emit(
        JoinRoomState.failure(
          failure: const Failure.validation(
            reason: ValidationReason.invalidRoomCode,
          ),
          attempt: ++_failures,
        ),
      );
      return;
    }

    emit(JoinRoomState.checking(code: code));
    final result = await _rooms.findMembership(code);
    if (isClosed) return;

    switch (result) {
      case Ok(value: final Member member):
        emit(JoinRoomState.alreadyMember(member: member));
      case Ok():
        emit(JoinRoomState.needsIdentity(code: code));
      case Err(:final failure):
        emit(JoinRoomState.failure(failure: failure, attempt: ++_failures));
    }
  }

  /// Back to the initial state, e.g. after returning from the room.
  void reset() => emit(const JoinRoomState.idle());
}
