import 'package:flutter/material.dart';

import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/features/chat/domain/entities/message.dart';
import 'package:rumour/features/chat/presentation/utils/chat_metrics.dart';

import 'message_meta.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final mine = message.isMine;

    final textColor = mine ? colors.onPrimaryVariant : colors.textPrimary;
    final metaColor = mine
        ? colors.onPrimaryVariant.withValues(alpha: 0.7)
        : colors.textMuted;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: ChatMetrics.maxBubbleWidth(context)),
      child: AnimatedContainer(
        duration: AppDurations.medium,
        padding: const EdgeInsets.all(ChatMetrics.bubblePadding),
        decoration: BoxDecoration(
          color: mine ? colors.primary : colors.surface,
          borderRadius: ChatMetrics.bubbleRadius(mine: mine),
        ),
        // IntrinsicWidth lets short messages hug their text while the time
        // stays right-aligned underneath.
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message.text,
                style: context.text.bodyMedium?.copyWith(color: textColor),
              ),
              const SizedBox(height: AppSpacing.sm),
              MessageMeta(
                createdAt: message.createdAt,
                isPending: message.isPending,
                color: metaColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
