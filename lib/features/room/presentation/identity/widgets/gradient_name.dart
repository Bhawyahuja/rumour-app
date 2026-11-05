import 'package:flutter/material.dart';
import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/core/widgets/animations/scramble_text.dart';
import 'package:rumour/features/room/domain/entities/alias.dart';

class GradientName extends StatelessWidget {
  const GradientName({super.key, required this.alias});

  final Alias alias;

  @override
  Widget build(BuildContext context) {
    final base = context.text.displayLarge ?? const TextStyle();
    final lines = alias.displayLines;

    // Vertical gradient spanning exactly the laid-out lines (x is irrelevant).
    final fontSize = base.fontSize ?? 60;
    final blockHeight = fontSize * (base.height ?? 1) * lines.length;
    final shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: context.colors.brandGradient,
    ).createShader(Rect.fromLTWH(0, 0, 1, blockHeight));

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: ScrambleText(
        lines.join('\n'),
        textAlign: TextAlign.center,
        // `foreground` replaces `color` (copyWith drops the theme colour).
        style: base.copyWith(foreground: Paint()..shader = shader),
      ),
    );
  }
}
