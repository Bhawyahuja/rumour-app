import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../animations/entrance.dart';
import '../buttons/pressable_scale.dart';

/// Centered title + subtitle (+ optional action) used for empty and error
/// states.
class StateMessageView extends StatelessWidget {
  const StateMessageView({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.actionLabel,
    this.onAction,
  });

  static const double _iconContainer = 56;

  final String title;
  final String subtitle;
  final IconData? icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xxxl + AppSpacing.sm,
          vertical: AppSpacing.xxl,
        ),
        child: Entrance(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Container(
                  width: _iconContainer,
                  height: _iconContainer,
                  decoration: BoxDecoration(
                    color: colors.surface,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: colors.accent, size: AppSizes.iconLg),
                ),
                const SizedBox(height: AppSpacing.lg),
              ],
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.text.titleLarge?.copyWith(color: colors.textPrimary),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: context.text.bodyMedium?.copyWith(color: colors.textMuted),
              ),
              if (actionLabel != null && onAction != null) ...[
                const SizedBox(height: AppSpacing.xl),
                PressableScale(
                  onTap: onAction,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.xl,
                      vertical: AppSpacing.md,
                    ),
                    decoration: BoxDecoration(
                      color: colors.surfaceHigh,
                      borderRadius: AppRadius.xlAll,
                    ),
                    child: Text(
                      actionLabel!,
                      style: context.text.labelMedium?.copyWith(color: colors.accent),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
