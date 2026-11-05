import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import 'pressable_scale.dart';

/// Circular icon button (header back button, theme toggle, …).
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.child,
    required this.background,
    this.onTap,
    this.size = AppSizes.iconButton,
    this.semanticLabel,
  });

  final Widget child;
  final Color background;
  final VoidCallback? onTap;
  final double size;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: PressableScale(
        onTap: onTap,
        scale: 0.9,
        child: AnimatedContainer(
          duration: AppDurations.medium,
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: background, shape: BoxShape.circle),
          child: child,
        ),
      ),
    );
  }
}
