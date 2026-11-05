import 'package:flutter/material.dart';
import 'package:rumour/core/theme/theme.dart';

class KeyBadge extends StatelessWidget {
  const KeyBadge({super.key});

  static const String asset = 'assets/icons/key.png';
  static const double _glyphWidth = 33;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.6, end: 1),
      duration: AppDurations.slower,
      curve: Curves.elasticOut,
      builder: (context, scale, child) =>
          Transform.scale(scale: scale, child: child),
      child: AnimatedContainer(
        duration: AppDurations.medium,
        width: AppSizes.badge,
        height: AppSizes.badge,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colors.surfaceHighest,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          asset,
          width: _glyphWidth,
          color: colors.accent,
          colorBlendMode: BlendMode.srcIn,
          excludeFromSemantics: true,
        ),
      ),
    );
  }
}
