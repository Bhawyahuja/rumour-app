import 'package:flutter/material.dart';

import 'app_color_tokens.dart';

/// Short, discoverable access to the design system from any widget:
///
/// ```dart
/// Text('Hi', style: context.text.bodyMedium?.copyWith(color: context.colors.textMuted));
/// ```
extension ThemeContext on BuildContext {
  AppColorTokens get colors =>
      Theme.of(this).extension<AppColorTokens>() ?? AppColorTokens.dark;

  TextTheme get text => Theme.of(this).textTheme;
}
