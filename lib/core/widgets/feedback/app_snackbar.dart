import 'package:flutter/material.dart';

import '../../theme/theme.dart';

enum AppSnackBarType { info, success, error }

/// Consistent floating snackbars across the app.
abstract final class AppSnackBar {
  static void show(
    BuildContext context,
    String message, {
    AppSnackBarType type = AppSnackBarType.info,
  }) {
    final colors = context.colors;
    final (icon, color) = switch (type) {
      AppSnackBarType.info => (Icons.info_outline_rounded, colors.textMuted),
      AppSnackBarType.success => (Icons.check_circle_outline_rounded, colors.accent),
      AppSnackBarType.error => (Icons.error_outline_rounded, colors.error),
    };

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            0,
            AppSpacing.lg,
            AppSpacing.lg,
          ),
          content: Row(
            children: [
              Icon(icon, size: AppSizes.iconMd, color: color),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  message,
                  // Colour comes from SnackBarThemeData.contentTextStyle.
                  style: Theme.of(context).snackBarTheme.contentTextStyle,
                ),
              ),
            ],
          ),
        ),
      );
  }

  static void error(BuildContext context, String message) =>
      show(context, message, type: AppSnackBarType.error);

  static void success(BuildContext context, String message) =>
      show(context, message, type: AppSnackBarType.success);
}
