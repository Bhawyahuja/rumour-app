import 'dart:ui';

/// Picks a stable colour for a participant from [palette].
///
/// The index comes from a fixed hash (FNV-1a) of the user id, so a person
/// keeps the same colour across pagination, restarts and devices — nothing
/// is stored. Dart's `String.hashCode` isn't used because it isn't
/// guaranteed to be stable across runs or SDK versions.
abstract final class ParticipantColor {
  static Color of(String userId, List<Color> palette) =>
      palette[indexOf(userId, palette.length)];

  static int indexOf(String userId, int paletteSize) {
    var hash = 0x811c9dc5;
    for (final unit in userId.codeUnits) {
      hash ^= unit;
      hash = (hash * 0x01000193) & 0xFFFFFFFF;
    }
    return hash % paletteSize;
  }
}
