import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// Small brand-coloured counter pill ("3", "99+").
class CountBadge extends StatelessWidget {
  const CountBadge({super.key, required this.count, this.max = 99});

  static const double _minSize = 20;

  final int count;
  final int max;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      constraints: const BoxConstraints(minWidth: _minSize, minHeight: _minSize),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: AppRadius.pillAll,
      ),
      child: Text(
        count > max ? '$max+' : '$count',
        style: context.text.labelSmall?.copyWith(
          color: colors.onPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
