part of 'identity_cubit.dart';

/// What the primary button should do in the current state.
enum IdentityAction { none, acknowledge, retry }

@freezed
sealed class IdentityState with _$IdentityState {
  const IdentityState._();

  /// Fetching an alias from the API.
  const factory IdentityState.generating() = IdentityGenerating;

  /// Alias ready to be acknowledged.
  const factory IdentityState.ready({required Alias alias}) = IdentityReady;

  /// Writing the membership to Firestore.
  const factory IdentityState.joining({required Alias alias}) = IdentityJoining;

  /// Membership persisted — navigate to chat.
  const factory IdentityState.joined({required Member member}) = IdentityJoined;

  /// [alias] is kept when only the join failed so the user can retry it.
  const factory IdentityState.failure({
    required Failure failure,
    Alias? alias,
  }) = IdentityFailure;

  // ── View helpers ───────────────────────────────────────────────────────
  Alias? get currentAlias => switch (this) {
        IdentityReady(:final alias) || IdentityJoining(:final alias) => alias,
        IdentityFailure(:final alias) => alias,
        IdentityGenerating() || IdentityJoined() => null,
      };

  /// Error replacing the name on the card (alias generation failed).
  Failure? get generationError => switch (this) {
        IdentityFailure(alias: null, :final failure) => failure,
        _ => null,
      };

  /// Error shown as a snackbar (joining failed, alias kept).
  Failure? get joinError => switch (this) {
        IdentityFailure(alias: _?, :final failure) => failure,
        _ => null,
      };

  bool get isJoining => this is IdentityJoining;

  IdentityAction get action => switch (this) {
        IdentityReady() => IdentityAction.acknowledge,
        IdentityFailure(alias: _?) => IdentityAction.acknowledge,
        IdentityFailure() => IdentityAction.retry,
        IdentityGenerating() || IdentityJoining() || IdentityJoined() =>
          IdentityAction.none,
      };
}
