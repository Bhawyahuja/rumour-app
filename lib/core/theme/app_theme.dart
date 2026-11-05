import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color_tokens.dart';
import 'app_text_theme.dart';
import 'tokens/app_radius.dart';
import 'tokens/color_primitives.dart';

abstract final class AppTheme {
  static final ThemeData dark = _build(Brightness.dark, AppColorTokens.dark);
  static final ThemeData light = _build(Brightness.light, AppColorTokens.light);

  static ThemeData _build(Brightness brightness, AppColorTokens c) {
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme(
      brightness: brightness,
      primary: c.primary,
      onPrimary: c.onPrimary,
      secondary: c.accent,
      onSecondary: c.onPrimary,
      error: c.error,
      onError: ColorPrimitives.white,
      surface: c.background,
      onSurface: c.textPrimary,
      onSurfaceVariant: c.textTertiary,
      surfaceContainerLowest: c.surfaceLowest,
      surfaceContainer: c.surface,
      surfaceContainerHigh: c.surfaceHigh,
      surfaceContainerHighest: c.surfaceHighest,
      outline: c.surfaceHigh,
    );

    final textTheme = AppTextTheme.build().apply(
      bodyColor: c.textPrimary,
      displayColor: c.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: c.background,
      splashFactory: InkSparkle.splashFactory,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: c.accent,
        selectionColor: c.primary.withValues(alpha: 0.35),
        selectionHandleColor: c.accent,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isDark ? c.surfaceHigh : ColorPrimitives.gray900,
        contentTextStyle:
            textTheme.bodyMedium?.copyWith(color: ColorPrimitives.white),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: c.accent),
      extensions: [c],
    );
  }

  static SystemUiOverlayStyle overlayFor(Brightness brightness, Color bg) {
    final isDark = brightness == Brightness.dark;
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: bg,
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
    );
  }
}
