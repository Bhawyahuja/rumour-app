import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// One-shot fade + slide played when the widget mounts with [animate] true.
///
/// The widget tree shape never changes with [animate], so flipping it to
/// `false` later (e.g. once the arrival animation is over) does not remount
/// the child or restart anything.
class SlideFadeIn extends StatelessWidget {
  const SlideFadeIn({
    super.key,
    required this.child,
    this.animate = true,
    this.from = const Offset(0, 0.25),
    this.duration = AppDurations.medium,
  });

  final Widget child;
  final bool animate;

  /// Start offset as a fraction of the child's size.
  final Offset from;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      // Only the `end` matters after the first build; it never changes, so
      // rebuilds never re-trigger the animation.
      tween: Tween<double>(begin: animate ? 0.0 : 1.0, end: 1.0),
      duration: duration,
      curve: Curves.easeOutCubic,
      child: child,
      // Opacity(1) adds no compositing layer, so the settled cost is nil.
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: FractionalTranslation(
          translation: Offset(from.dx * (1 - t), from.dy * (1 - t)),
          child: child,
        ),
      ),
    );
  }
}
