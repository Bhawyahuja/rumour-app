import 'package:flutter/material.dart';

/// Primitive colour values from the Figma file (tier 1 tokens).
///
/// **Only theme files may import this.** Widgets read semantic roles through
/// `context.colors` ([AppColorTokens]) so a re-brand or a new theme never
/// touches feature code.
abstract final class ColorPrimitives {
  // Brand
  static const Color primary = Color(0xFFA3E635);
  static const Color nameGradientStart = Color(0xFFE8E161);
  static const Color nameGradientEnd = Color(0xFFBCE359);

  // Dark surfaces
  static const Color black = Color(0xFF27272A); // key badge / code field
  static const Color darkBackground = Color(0xFF09090B);
  static const Color darkCard = Color(0xFF111520); // identity card, bubbles, composer
  static const Color darkElevated = Color(0xFF212936); // back button, date chip
  static const Color pureBlack = Color(0xFF000000);

  // Text
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFFAFAFA);
  static const Color grey = Color(0xFFD1D5DB);
  static const Color zinc400 = Color(0xFFA1A1AA);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color ink = Color(0xFF212936); // text on primary bubbles

  // Light surfaces
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color zinc100 = Color(0xFFF4F4F5);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color zinc600 = Color(0xFF52525B);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray900 = Color(0xFF111827);
  static const Color lime700 = Color(0xFF4D7C0F);
  static const Color lime600 = Color(0xFF65A30D);

  // Feedback
  static const Color errorDark = Color(0xFFF87171);
  static const Color errorLight = Color(0xFFDC2626);
}
