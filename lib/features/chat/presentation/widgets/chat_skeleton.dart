import 'package:flutter/material.dart';
import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/core/widgets/loaders/shimmer.dart';
import 'package:rumour/features/chat/presentation/utils/chat_metrics.dart';

class ChatSkeleton extends StatelessWidget {
  const ChatSkeleton({super.key});

  // (isMine, bubble width factor, bubble height)
  static const List<(bool, double, double)> _rows = [
    (false, 0.78, 84),
    (true, 0.55, 48),
    (false, 0.62, 66),
    (true, 0.70, 66),
    (false, 0.45, 48),
  ];

  static const double _minBubbleWidth = 120;

  @override
  Widget build(BuildContext context) {
    final maxWidth = ChatMetrics.maxBubbleWidth(context);
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Shimmer(
      child: ListView(
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(
          top: AppSpacing.lg,
          bottom: AppSpacing.xxl,
        ),
        children: [
          for (final (mine, factor, height) in _rows.reversed)
            Padding(
              padding: ChatMetrics.rowPadding(mine: mine, top: AppSpacing.lg),
              child: Column(
                crossAxisAlignment: mine
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  ShimmerBox(
                    width: mine ? 32.0 : 96.0,
                    height: AppSpacing.md,
                    radius: AppRadius.sm,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ShimmerBox(
                    width: (screenWidth * factor)
                        .clamp(_minBubbleWidth, maxWidth)
                        .toDouble(),
                    height: height,
                    borderRadius: ChatMetrics.bubbleRadius(mine: mine),
                  ),
                ],
              ),
            ),
          const Padding(
            padding: EdgeInsets.only(bottom: AppSpacing.sm),
            child: Center(child: ShimmerBox(width: 56, height: AppSpacing.xxl)),
          ),
        ],
      ),
    );
  }
}
