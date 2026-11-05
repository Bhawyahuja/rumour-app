import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../loaders/pulsing_dots.dart';
import 'pressable_scale.dart';

/// Full-width brand CTA with a soft glow.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final enabled = onPressed != null && !isLoading;

    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      child: PressableScale(
        onTap: enabled ? onPressed : null,
        child: AnimatedOpacity(
          duration: AppDurations.fast,
          opacity: onPressed == null ? 0.5 : 1,
          child: Container(
            height: AppSizes.buttonHeight,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: AppRadius.lgAll,
              boxShadow: [
                BoxShadow(
                  color: colors.primary.withValues(alpha: 0.28),
                  blurRadius: AppSpacing.lg,
                  offset: const Offset(0, AppSpacing.xs),
                ),
              ],
            ),
            child: AnimatedSwitcher(
              duration: AppDurations.fast,
              child: isLoading
                  ? PulsingDots(
                      key: const ValueKey('loading'),
                      color: colors.onPrimary,
                      size: 7,
                    )
                  : Text(
                      label,
                      key: ValueKey(label),
                      style:
                          context.text.labelLarge?.copyWith(color: colors.onPrimary),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
