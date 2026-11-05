import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/theme_context.dart';

class PulsingDots extends StatefulWidget {
  const PulsingDots({
    super.key,
    this.color,
    this.size = 8,
    this.spacing = 6,
    this.semanticLabel,
  });

  final Color? color;
  final double size;
  final double spacing;

  final String? semanticLabel;

  @override
  State<PulsingDots> createState() => _PulsingDotsState();
}

class _PulsingDotsState extends State<PulsingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? context.colors.accent;
    return Center(
      child: Semantics(
        label: widget.semanticLabel ?? context.l10n.commonLoading,
        liveRegion: true,
        child: SizedBox(
          height: widget.size * 2,
          child: AnimatedBuilder(
            animation: _c,
            builder: (context, _) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var i = 0; i < 3; i++) ...[
                  if (i > 0) SizedBox(width: widget.spacing),
                  _dot(color, _phase(i)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _phase(int index) {
    final t = (_c.value - index * 0.16) % 1.0;
    return t < 0.5 ? math.sin(t * 2 * math.pi).clamp(0.0, 1.0).toDouble() : 0.0;
  }

  Widget _dot(Color color, double v) => Transform.translate(
    offset: Offset(0, -widget.size * 0.6 * v),
    child: Opacity(
      opacity: 0.35 + 0.65 * v,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    ),
  );
}
