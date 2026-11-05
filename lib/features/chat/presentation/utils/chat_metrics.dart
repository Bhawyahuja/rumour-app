import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import '../../../../core/theme/theme.dart';

/// Bubble geometry shared by real bubbles and the loading skeleton, so the
/// two can never drift apart.
abstract final class ChatMetrics {
  /// Figma: received bubbles sit 16pt from the left edge…
  static const double receivedGutter = AppSpacing.listGutter;

  /// …and sent bubbles 28pt from the right edge.
  static const double sentGutter = 28;

  static const double bubblePadding = AppSpacing.md;

  static EdgeInsets rowPadding({required bool mine, double top = 0}) =>
      EdgeInsets.fromLTRB(
        receivedGutter,
        top,
        mine ? sentGutter : receivedGutter,
        0,
      );

  /// Rounded everywhere except the corner on the sender's side.
  static BorderRadius bubbleRadius({required bool mine}) {
    const r = Radius.circular(AppRadius.md);
    return BorderRadius.only(
      topLeft: mine ? r : Radius.zero,
      topRight: mine ? Radius.zero : r,
      bottomLeft: r,
      bottomRight: r,
    );
  }

  static double maxBubbleWidth(BuildContext context) => math.min(
        AppSizes.bubbleMaxWidth,
        MediaQuery.sizeOf(context).width * 0.805,
      );
}
