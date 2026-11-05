
import 'package:rumour/core/constants/app_constants.dart';

abstract final class RoomCode {
  static final RegExp _pattern =
      RegExp('^\\d{${AppConstants.roomCodeLength}}\$');

  static bool isValid(String code) => _pattern.hasMatch(code);

  /// Strips everything that is not a digit and clamps the length.
  static String sanitize(String input) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    return digits.length > AppConstants.roomCodeLength
        ? digits.substring(0, AppConstants.roomCodeLength)
        : digits;
  }
}
