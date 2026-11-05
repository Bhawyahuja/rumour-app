import 'package:flutter/material.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/core/l10n/failure_l10n.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/theme_context.dart';
import 'package:rumour/core/theme/tokens/app_durations.dart';
import 'package:rumour/core/theme/tokens/app_spacing.dart';
import 'package:rumour/core/widgets/loaders/pulsing_dots.dart';

class JoinStatusLine extends StatelessWidget {
  const JoinStatusLine({super.key, required this.isChecking, this.error});

  static const double _minHeight = 40;

  final bool isChecking;
  final Failure? error;

  @override
  Widget build(BuildContext context) {
    final Widget child;
    if (isChecking) {
      child = PulsingDots(
        key: const ValueKey('checking'),
        semanticLabel: context.l10n.joinChecking,
      );
    } else if (error case final failure?) {
      final message = failure.localize(context.l10n);
      child = Padding(
        key: ValueKey(message),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xxxl + AppSpacing.lg,
        ),
        child: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: context.text.bodySmall?.copyWith(
              color: context.colors.error,
            ),
          ),
        ),
      );
    } else {
      child = const SizedBox.shrink(key: ValueKey('none'));
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: _minHeight),
      child: AnimatedSwitcher(
        duration: AppDurations.fast,
        transitionBuilder: (child, a) => FadeTransition(
          opacity: a,
          child: SizeTransition(sizeFactor: a, child: child),
        ),
        child: child,
      ),
    );
  }
}
