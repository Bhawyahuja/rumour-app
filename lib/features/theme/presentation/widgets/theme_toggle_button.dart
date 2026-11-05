import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/theme_context.dart';
import 'package:rumour/core/theme/tokens/app_durations.dart';
import 'package:rumour/core/theme/tokens/app_sizes.dart';
import 'package:rumour/core/widgets/app_icon.dart';
import 'package:rumour/core/widgets/buttons/circle_icon_button.dart';
import 'package:rumour/features/theme/presentation/cubit/theme_cubit.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: CircleIconButton(
        background: colors.surfaceLowest,
        semanticLabel: isDark
            ? context.l10n.themeSwitchToLight
            : context.l10n.themeSwitchToDark,
        onTap: () => context.read<ThemeCubit>().toggle(brightness),
        child: AnimatedSwitcher(
          duration: AppDurations.medium,
          transitionBuilder: (child, animation) => RotationTransition(
            turns: Tween<double>(begin: -0.25, end: 0).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: ScaleTransition(scale: animation, child: child),
            ),
          ),
          child: Transform.rotate(
            key: ValueKey(isDark),
            angle: isDark ? 0 : math.pi / 12,
            child: AppIcon(
              isDark ? AppIconData.sun : AppIconData.moon,
              size: AppSizes.iconSm,
              color: colors.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}
