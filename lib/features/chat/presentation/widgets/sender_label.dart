import 'package:flutter/material.dart';
import 'package:rumour/core/theme/theme.dart';

class SenderLabel extends StatelessWidget {
  const SenderLabel({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.text.labelMedium?.copyWith(
          color: color ?? context.colors.textPrimary,
        ),
      ),
    );
  }
}
