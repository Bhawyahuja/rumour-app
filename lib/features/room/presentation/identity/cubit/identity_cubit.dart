import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/features/room/domain/entities/alias.dart';
import 'package:rumour/features/room/domain/entities/member.dart';
import 'package:rumour/features/room/domain/repositories/alias_repository.dart';
import 'package:rumour/features/room/domain/repositories/room_repository.dart';



part 'identity_cubit.freezed.dart';
part 'identity_state.dart';

class IdentityCubit extends Cubit<IdentityState> {
  IdentityCubit({
    required this.roomCode,
    required AliasRepository aliases,
    required RoomRepository rooms,
  })  : _aliases = aliases,
        _rooms = rooms,
        super(const IdentityState.generating());

  final String roomCode;
  final AliasRepository _aliases;
  final RoomRepository _rooms;

  Future<void> generate() async {
    emit(const IdentityState.generating());
    final result = await _aliases.generateAlias(roomCode: roomCode);
    if (isClosed) return;
    emit(
      result.fold(
        (failure) => IdentityState.failure(failure: failure),
        (alias) => IdentityState.ready(alias: alias),
      ),
    );
  }

  /// Handles the primary button according to [IdentityState.action].
  Future<void> onPrimaryAction() => switch (state.action) {
        IdentityAction.acknowledge => acknowledge(),
        IdentityAction.retry => generate(),
        IdentityAction.none => Future<void>.value(),
      };

  Future<void> acknowledge() async {
    final alias = state.currentAlias;
    if (alias == null) {
      // Nothing to acknowledge yet (e.g. generation failed) — retry instead.
      return generate();
    }

    emit(IdentityState.joining(alias: alias));
    final result = await _rooms.joinRoom(
      code: roomCode,
      alias: alias.displayName,
      handle: alias.handle,
    );
    if (isClosed) return;
    emit(
      result.fold(
        (failure) => IdentityState.failure(failure: failure, alias: alias),
        (member) => IdentityState.joined(member: member),
      ),
    );
  }
}
