import 'package:flutter/material.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/features/room/domain/entities/alias.dart';

import 'gradient_name.dart';
import 'name_error.dart';
import 'name_placeholder.dart';

class IdentityCard extends StatelessWidget {
  const IdentityCard({super.key, required this.alias, this.error});

  /// `null` while generating (or when generation failed).
  final Alias? alias;

  /// Shown instead of the name when generation failed.
  final Failure? error;

  /// Two lines of 60pt at 0.92 line-height.
  static const double _nameBlockHeight = 112;
  static const double _nameGap = 14;

  Widget _name() {
    if (alias case final a?) return GradientName(key: ValueKey(a), alias: a);
    if (error case final e?) {
      return NameError(key: const ValueKey('error'), failure: e);
    }
    return const NamePlaceholder(key: ValueKey('loading'));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AnimatedContainer(
      duration: AppDurations.medium,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.xxxl,
      ),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.lgAll,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.l10n.identityCaption,
            textAlign: TextAlign.center,
            style: context.text.bodySmall?.copyWith(color: colors.textMuted),
          ),
          const SizedBox(height: _nameGap),
          SizedBox(
            height: _nameBlockHeight,
            child: AnimatedSwitcher(
              duration: AppDurations.slow,
              switchInCurve: Curves.easeOutBack,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, a) => FadeTransition(
                opacity: a,
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.9, end: 1).animate(a),
                  child: child,
                ),
              ),
              child: _name(),
            ),
          ),
          const SizedBox(height: _nameGap),
          Text(
            context.l10n.identityDescription,
            textAlign: TextAlign.center,
            style: context.text.bodySmall?.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
