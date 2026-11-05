import 'package:flutter/material.dart';
import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/core/utils/date_formatter.dart';
import 'package:rumour/core/widgets/app_icon.dart';

class MessageMeta extends StatelessWidget {
  const MessageMeta({
    super.key,
    required this.createdAt,
    required this.isPending,
    required this.color,
  });

  final DateTime createdAt;
  final bool isPending;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedOpacity(
          opacity: isPending ? 1 : 0,
          duration: AppDurations.fast,
          child: Padding(
            padding: const EdgeInsets.only(right: AppSpacing.xs),
            child: AppIcon(
              AppIconData.clock,
              size: AppSizes.iconXs,
              color: color,
            ),
          ),
        ),
        Flexible(
          child: Text(
            DateFormatter.time(createdAt),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: context.text.labelSmall?.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
