import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// Reveals [text] left-to-right while not-yet-revealed letters flicker
/// through random characters — a "decoding" effect for the alias reveal.
class ScrambleText extends StatefulWidget {
  const ScrambleText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.duration = AppDurations.slower,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Duration duration;

  @override
  State<ScrambleText> createState() => _ScrambleTextState();
}

class _ScrambleTextState extends State<ScrambleText>
    with SingleTickerProviderStateMixin {
  static const String _glyphs = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  final math.Random _random = math.Random();
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  @override
  void initState() {
    super.initState();
    _c.forward();
  }

  @override
  void didUpdateWidget(covariant ScrambleText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) _c.forward(from: 0);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  String _frame(double t) {
    if (t >= 1) return widget.text;
    final revealed = (widget.text.length * Curves.easeOut.transform(t)).floor();
    final buffer = StringBuffer();
    for (var i = 0; i < widget.text.length; i++) {
      final ch = widget.text[i];
      final keep = i < revealed || ch == ' ' || ch == '\n';
      buffer.write(keep ? ch : _glyphs[_random.nextInt(_glyphs.length)]);
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.text,
      child: ExcludeSemantics(
        child: AnimatedBuilder(
          animation: _c,
          builder: (context, _) => Text(
            _frame(_c.value),
            style: widget.style,
            textAlign: widget.textAlign,
          ),
        ),
      ),
    );
  }
}
