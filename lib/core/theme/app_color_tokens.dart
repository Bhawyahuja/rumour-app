import 'package:flutter/material.dart';

import 'tokens/color_primitives.dart';

/// Semantic colour roles (tier 2 tokens), resolved per theme.
///
/// Roles describe *purpose*, never a component: a chat bubble uses `surface`
/// and `textPrimary`, a sent bubble uses `primary` — so adding components
/// never adds colours here. Read via `context.colors`.
@immutable
class AppColorTokens extends ThemeExtension<AppColorTokens> {
  const AppColorTokens({
    required this.background,
    required this.surfaceLowest,
    required this.surface,
    required this.surfaceHigh,
    required this.surfaceHighest,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textMuted,
    required this.textDisabled,
    required this.primary,
    required this.onPrimary,
    required this.onPrimaryVariant,
    required this.accent,
    required this.error,
    required this.brandGradient,
    required this.participantColors,
  });

  // Surfaces, lowest → highest emphasis.
  final Color background;
  final Color surfaceLowest;
  final Color surface;
  final Color surfaceHigh;
  final Color surfaceHighest;

  // Content, highest → lowest emphasis.
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textMuted;
  final Color textDisabled;

  // Brand.
  final Color primary;
  final Color onPrimary;

  /// Softer content colour on [primary] (e.g. long text, metadata).
  final Color onPrimaryVariant;

  /// Brand colour for foreground use on neutral surfaces (icons, links,
  /// focus); darker in light mode for contrast.
  final Color accent;
  final List<Color> brandGradient;

  // Feedback.
  final Color error;

  /// Name colours for other chat participants (no lime — that's "you").
  /// All pass WCAG AA (≥ 4.5:1) on [background].
  final List<Color> participantColors;

  static const AppColorTokens dark = AppColorTokens(
    background: ColorPrimitives.darkBackground,
    surfaceLowest: ColorPrimitives.pureBlack,
    surface: ColorPrimitives.darkCard,
    surfaceHigh: ColorPrimitives.darkElevated,
    surfaceHighest: ColorPrimitives.black,
    textPrimary: ColorPrimitives.offWhite,
    textSecondary: ColorPrimitives.grey,
    textTertiary: ColorPrimitives.zinc400,
    textMuted: ColorPrimitives.gray400,
    textDisabled: ColorPrimitives.gray500,
    primary: ColorPrimitives.primary,
    onPrimary: ColorPrimitives.pureBlack,
    onPrimaryVariant: ColorPrimitives.ink,
    accent: ColorPrimitives.primary,
    error: ColorPrimitives.errorDark,
    brandGradient: [
      ColorPrimitives.nameGradientStart,
      ColorPrimitives.nameGradientEnd,
    ],
    participantColors: [
      Color(0xFF38BDF8), // sky
      Color(0xFFA78BFA), // violet
      Color(0xFFF472B6), // pink
      Color(0xFFFBBF24), // amber
      Color(0xFFFB923C), // orange
      Color(0xFF2DD4BF), // teal
      Color(0xFF818CF8), // indigo
    ],
  );

  static const AppColorTokens light = AppColorTokens(
    background: ColorPrimitives.lightBackground,
    surfaceLowest: ColorPrimitives.zinc100,
    surface: ColorPrimitives.gray100,
    surfaceHigh: ColorPrimitives.gray200,
    surfaceHighest: ColorPrimitives.zinc100,
    textPrimary: ColorPrimitives.darkBackground,
    textSecondary: ColorPrimitives.gray700,
    textTertiary: ColorPrimitives.zinc600,
    textMuted: ColorPrimitives.gray500,
    textDisabled: ColorPrimitives.gray400,
    primary: ColorPrimitives.primary,
    onPrimary: ColorPrimitives.pureBlack,
    onPrimaryVariant: ColorPrimitives.ink,
    accent: ColorPrimitives.lime600,
    error: ColorPrimitives.errorLight,
    brandGradient: [ColorPrimitives.lime600, ColorPrimitives.lime700],
    participantColors: [
      Color(0xFF0369A1), // sky
      Color(0xFF6D28D9), // violet
      Color(0xFFBE185D), // pink
      Color(0xFFB45309), // amber
      Color(0xFFC2410C), // orange
      Color(0xFF0F766E), // teal
      Color(0xFF4338CA), // indigo
    ],
  );

  @override
  AppColorTokens copyWith({
    Color? background,
    Color? surfaceLowest,
    Color? surface,
    Color? surfaceHigh,
    Color? surfaceHighest,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textMuted,
    Color? textDisabled,
    Color? primary,
    Color? onPrimary,
    Color? onPrimaryVariant,
    Color? accent,
    Color? error,
    List<Color>? brandGradient,
    List<Color>? participantColors,
  }) {
    return AppColorTokens(
      background: background ?? this.background,
      surfaceLowest: surfaceLowest ?? this.surfaceLowest,
      surface: surface ?? this.surface,
      surfaceHigh: surfaceHigh ?? this.surfaceHigh,
      surfaceHighest: surfaceHighest ?? this.surfaceHighest,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textMuted: textMuted ?? this.textMuted,
      textDisabled: textDisabled ?? this.textDisabled,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      onPrimaryVariant: onPrimaryVariant ?? this.onPrimaryVariant,
      accent: accent ?? this.accent,
      error: error ?? this.error,
      brandGradient: brandGradient ?? this.brandGradient,
      participantColors: participantColors ?? this.participantColors,
    );
  }

  @override
  AppColorTokens lerp(ThemeExtension<AppColorTokens>? other, double t) {
    if (other is! AppColorTokens) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColorTokens(
      background: c(background, other.background),
      surfaceLowest: c(surfaceLowest, other.surfaceLowest),
      surface: c(surface, other.surface),
      surfaceHigh: c(surfaceHigh, other.surfaceHigh),
      surfaceHighest: c(surfaceHighest, other.surfaceHighest),
      textPrimary: c(textPrimary, other.textPrimary),
      textSecondary: c(textSecondary, other.textSecondary),
      textTertiary: c(textTertiary, other.textTertiary),
      textMuted: c(textMuted, other.textMuted),
      textDisabled: c(textDisabled, other.textDisabled),
      primary: c(primary, other.primary),
      onPrimary: c(onPrimary, other.onPrimary),
      onPrimaryVariant: c(onPrimaryVariant, other.onPrimaryVariant),
      accent: c(accent, other.accent),
      error: c(error, other.error),
      brandGradient: [
        c(brandGradient.first, other.brandGradient.first),
        c(brandGradient.last, other.brandGradient.last),
      ],
      participantColors: [
        for (var i = 0; i < participantColors.length; i++)
          c(participantColors[i], other.participantColors[i]),
      ],
    );
  }
}
