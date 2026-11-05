import 'package:flutter/material.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/tokens/app_spacing.dart';
import 'package:rumour/core/widgets/loaders/shimmer.dart';


class NamePlaceholder extends StatelessWidget {
  const NamePlaceholder({super.key});

  static const double _lineHeight = 44;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: context.l10n.identityGenerating,
      child: const Shimmer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShimmerBox(width: 160, height: _lineHeight),
            SizedBox(height: AppSpacing.md),
            ShimmerBox(width: 210, height: _lineHeight),
          ],
        ),
      ),
    );
  }
}
