import 'package:flutter/material.dart';
import 'package:rumour/core/theme/theme.dart';

class CodeSlot extends StatelessWidget {
  const CodeSlot({
    super.key,
    required this.digit,
    required this.isActive,
    required this.hasError,
  });

  static const double dashWidth = 16.5;
  static const double dashHeight = 3.3;
  static const double _digitHeight = 28;

  final String? digit;
  final bool isActive;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final dashColor = hasError
        ? colors.error
        : isActive
        ? colors.accent
        : digit != null
        ? colors.textPrimary
        : colors.textTertiary;

    return SizedBox(
      width: dashWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: _digitHeight,
            child: AnimatedSwitcher(
              duration: AppDurations.fast,
              transitionBuilder: (child, a) => ScaleTransition(
                scale: CurvedAnimation(parent: a, curve: Curves.easeOutBack),
                child: FadeTransition(opacity: a, child: child),
              ),
              child: digit == null
                  ? const SizedBox.shrink(key: ValueKey('empty'))
                  : OverflowBox(
                      key: ValueKey(digit),
                      maxWidth: 24,
                      child: Text(
                        digit!,
                        textAlign: TextAlign.center,
                        style: context.text.headlineSmall?.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          _Dash(color: dashColor, isActive: isActive),
        ],
      ),
    );
  }
}

/// The active dash gently "breathes" to show where the next digit goes.
class _Dash extends StatefulWidget {
  const _Dash({required this.color, required this.isActive});

  final Color color;
  final bool isActive;

  @override
  State<_Dash> createState() => _DashState();
}

class _DashState extends State<_Dash> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  @override
  void initState() {
    super.initState();
    _sync();
  }

  @override
  void didUpdateWidget(covariant _Dash oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isActive != widget.isActive) _sync();
  }

  void _sync() {
    if (widget.isActive) {
      _c.repeat(reverse: true);
    } else {
      _c
        ..stop()
        ..value = 0;
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 1, end: 0.35).animate(_c),
      child: AnimatedContainer(
        duration: AppDurations.fast,
        width: CodeSlot.dashWidth,
        height: CodeSlot.dashHeight,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: AppRadius.xsAll,
        ),
      ),
    );
  }
}
