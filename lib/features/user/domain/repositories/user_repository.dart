/// Provides the anonymous, per-install identity of the current user.
abstract interface class UserRepository {
  Future<String> ensureUserId();

  String get currentUserId;
}
