/// App-wide, non-visual constants.
abstract final class AppConstants {
  /// Number of digits in a room code.
  static const int roomCodeLength = 6;

  /// Page size used for the live message window and for older-page fetches.
  static const int messagesPageSize = 30;

  /// Max characters allowed in a single message (mirrored in firestore.rules).
  static const int maxMessageLength = 1000;

  /// How many random users we try before giving up on a name unique in the room.
  static const int aliasMaxAttempts = 5;

  /// Random User Generator — source of the per-room anonymous identity.
  static const String randomUserBaseUrl = 'https://randomuser.me';
  static const String randomUserPath = '/api/';
  static const String randomUserNationalities =
      'au,br,ca,ch,de,dk,es,fi,fr,gb,ie,mx,nl,no,nz,us';
  static const Duration networkTimeout = Duration(seconds: 6);
}

/// Firestore collection / field names. Keep in sync with `firestore.rules`.
abstract final class FirestorePaths {
  static const String rooms = 'rooms';
  static const String members = 'members';
  static const String messages = 'messages';

  static String room(String code) => '$rooms/$code';

  static String roomMembers(String code) => '$rooms/$code/$members';

  static String roomMessages(String code) => '$rooms/$code/$messages';
}

/// Keys used in local key/value storage.
abstract final class StorageKeys {
  static const String deviceUserId = 'device_user_id';
  static const String themeMode = 'theme_mode';
}
