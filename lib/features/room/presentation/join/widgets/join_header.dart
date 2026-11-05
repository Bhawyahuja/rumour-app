import 'package:flutter/material.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/theme_context.dart';
import 'package:rumour/core/theme/tokens/app_durations.dart';
import 'package:rumour/core/widgets/animations/entrance.dart';

class JoinHeader extends StatelessWidget {
  const JoinHeader({super.key});

  static const double _titleGap = 10;
  static const double _subtitleInset = 44;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      children: [
        Entrance(
          delay: AppDurations.instant,
          child: Text(
            context.l10n.joinTitle,
            textAlign: TextAlign.center,
            style: context.text.headlineMedium?.copyWith(
              color: colors.textPrimary,
              fontSize: 30,
            ),
          ),
        ),
        const SizedBox(height: _titleGap),
        Entrance(
          delay: AppDurations.fast,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: _subtitleInset),
            child: Text(
              context.l10n.joinSubtitle,
              textAlign: TextAlign.center,
              style: context.text.bodyMedium?.copyWith(
                color: colors.textTertiary,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
