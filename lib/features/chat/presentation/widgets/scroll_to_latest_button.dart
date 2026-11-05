import 'package:flutter/material.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/core/widgets/buttons/pressable_scale.dart';
import 'package:rumour/core/widgets/feedback/count_badge.dart';

class ScrollToLatestButton extends StatelessWidget {
  const ScrollToLatestButton({
    super.key,
    required this.visible,
    required this.unreadCount,
    required this.onPressed,
  });

  final bool visible;
  final int unreadCount;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return IgnorePointer(
      ignoring: !visible,
      child: AnimatedScale(
        scale: visible ? 1.0 : 0.6,
        duration: AppDurations.fast,
        curve: AppCurves.emphasized,
        child: AnimatedOpacity(
          opacity: visible ? 1.0 : 0.0,
          duration: AppDurations.fast,
          child: Semantics(
            button: true,
            label: context.l10n.chatScrollToLatest(unreadCount),
            child: PressableScale(
              onTap: onPressed,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: AppSizes.iconButton,
                    height: AppSizes.iconButton,
                    decoration: BoxDecoration(
                      color: colors.surfaceHigh,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: AppSpacing.md,
                          offset: const Offset(0, AppSpacing.xs),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: colors.textPrimary,
                    ),
                  ),
                  if (unreadCount > 0)
                    Positioned(
                      top: -AppSpacing.xs,
                      right: -AppSpacing.xs,
                      child: ExcludeSemantics(
                        child: CountBadge(count: unreadCount),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
