import 'package:flutter/material.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/core/l10n/failure_l10n.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/theme.dart';

class NameError extends StatelessWidget {
  const NameError({super.key, required this.failure});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.cloud_off_rounded,
            color: colors.error,
            size: AppSizes.iconXl,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            failure.localize(context.l10n),
            textAlign: TextAlign.center,
            style: context.text.labelMedium?.copyWith(color: colors.error),
          ),
        ],
      ),
    );
  }
}
