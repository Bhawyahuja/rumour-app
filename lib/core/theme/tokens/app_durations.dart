import 'package:flutter/animation.dart';

abstract final class AppDurations {
  /// Press feedback, micro state changes.
  static const Duration instant = Duration(milliseconds: 120);

  /// Fades, colour/opacity changes, small switches.
  static const Duration fast = Duration(milliseconds: 200);

  /// Size changes, list item entrances, theme switch.
  static const Duration medium = Duration(milliseconds: 300);

  /// Page transitions, hero reveals.
  static const Duration slow = Duration(milliseconds: 450);

  /// Playful one-offs (elastic badge, scramble reveal).
  static const Duration slower = Duration(milliseconds: 700);
}

abstract final class AppCurves {
  static const Curve standard = Curves.easeOutCubic;
  static const Curve emphasized = Curves.easeOutBack;
  static const Curve exit = Curves.easeInCubic;
}
