part of 'join_room_cubit.dart';

@freezed
sealed class JoinRoomState with _$JoinRoomState {
  const JoinRoomState._();

  /// Waiting for the user to type a code.
  const factory JoinRoomState.idle() = JoinRoomIdle;

  /// Looking up whether the user already has an identity in the room.
  const factory JoinRoomState.checking({required String code}) =
      JoinRoomChecking;

  /// First visit: an alias must be generated and acknowledged.
  const factory JoinRoomState.needsIdentity({required String code}) =
      JoinRoomNeedsIdentity;

  /// Returning user: go straight to the chat with the existing alias.
  const factory JoinRoomState.alreadyMember({required Member member}) =
      JoinRoomAlreadyMember;

  /// [attempt] increases on every failure so identical failures still notify
  /// listeners (used to replay the shake animation).
  const factory JoinRoomState.failure({
    required Failure failure,
    required int attempt,
  }) = JoinRoomFailure;

  // ── View helpers (keep widgets free of state inspection) ───────────────
  bool get isChecking => this is JoinRoomChecking;

  bool get canEdit => !isChecking;

  /// The current error, localized by the UI.
  Failure? get error => switch (this) {
        JoinRoomFailure(:final failure) => failure,
        _ => null,
      };

  /// Changes on every failure; `0` when there is no error.
  int get errorTick => switch (this) {
        JoinRoomFailure(:final attempt) => attempt,
        _ => 0,
      };

  /// `true` for states that should trigger navigation away from the screen.
  bool get isNavigation =>
      this is JoinRoomNeedsIdentity || this is JoinRoomAlreadyMember;
}
