import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rumour/core/utils/result.dart';
import 'package:rumour/features/room/domain/entities/room.dart';
import 'package:rumour/features/room/domain/repositories/room_repository.dart';

part 'room_info_cubit.freezed.dart';
part 'room_info_state.dart';

class RoomInfoCubit extends Cubit<RoomInfoState> {
  RoomInfoCubit({required String roomCode, required RoomRepository rooms})
    : super(RoomInfoState(room: Room.empty(roomCode))) {
    _sub = rooms.watchRoom(roomCode).listen((result) {
      switch (result) {
        case Ok(:final value):
          emit(RoomInfoState(room: value, isLoaded: true));
        case Err():
          // Keep the last known value, but stop the loading shimmer.
          if (!state.isLoaded) emit(state.copyWith(isLoaded: true));
      }
    });
  }

  StreamSubscription<Result<Room>>? _sub;

  @override
  Future<void> close() async {
    await _sub?.cancel();
    return super.close();
  }
}
