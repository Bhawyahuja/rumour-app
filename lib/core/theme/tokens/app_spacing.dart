/// 4-pt spacing scale. Use these instead of raw numbers for paddings/gaps.
///
/// Screen-specific offsets measured from Figma (e.g. the 168pt gap above the
/// join title) live as named constants next to the screen that uses them.
abstract final class AppSpacing {
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;

  /// Horizontal page gutter (header, cards, buttons).
  static const double pageGutter = xl;

  /// Horizontal gutter for list content (chat bubbles, composer).
  static const double listGutter = lg;

  /// Distance between the status bar and the first row of a screen.
  static const double screenTop = 38;
}
