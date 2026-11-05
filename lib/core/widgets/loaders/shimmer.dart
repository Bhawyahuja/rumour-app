import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../../theme/theme.dart';

/// Sweeps a soft highlight across its [child]. Wrap a group of
/// [ShimmerBox]es in ONE [Shimmer] so they animate in sync with a single
/// ticker (cheaper than one controller per placeholder).
class Shimmer extends StatefulWidget {
  const Shimmer({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1400),
  });

  final Widget child;
  final Duration duration;

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final base = colors.surfaceHigh;
    final highlight = Color.lerp(colors.surfaceHigh, colors.textMuted, 0.25)!;

    return Semantics(
      label: context.l10n.commonLoading,
      child: AnimatedBuilder(
        animation: _c,
        child: widget.child,
        builder: (context, child) {
          // Slide a 3-stop gradient from far left to far right.
          final dx = _c.value * 3 - 1.5;
          return ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(
              begin: Alignment(dx - 1, -0.3),
              end: Alignment(dx + 1, 0.3),
              colors: [base, highlight, base],
              stops: const [0.25, 0.5, 0.75],
            ).createShader(bounds),
            child: child,
          );
        },
      ),
    );
  }
}

/// Rounded placeholder block. Its colour is replaced by the [Shimmer]
/// gradient, so it only needs to be opaque.
class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    super.key,
    this.width,
    required this.height,
    this.radius = AppRadius.md,
    this.borderRadius,
  });

  final double? width;
  final double height;
  final double radius;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: context.colors.surfaceHigh,
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
      ),
    );
  }
}
