import 'package:flutter/material.dart';

import 'package:rumour/core/theme/theme.dart';

class DateChip extends StatelessWidget {
  const DateChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: colors.surfaceHigh,
          borderRadius: AppRadius.mdAll,
        ),
        child: Text(
          label,
          style: context.text.labelSmall?.copyWith(color: colors.textMuted),
        ),
      ),
    );
  }
}
