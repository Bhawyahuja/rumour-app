import 'package:flutter/material.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/core/widgets/loaders/pulsing_dots.dart';



class HistoryLoader extends StatelessWidget {
  const HistoryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Center(
        child: PulsingDots(
          size: 6,
          semanticLabel: context.l10n.chatLoadingOlder,
        ),
      ),
    );
  }
}
