import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../../theme/theme.dart';
import '../app_icon.dart';
import 'circle_icon_button.dart';

/// Round chevron back button from the room header.
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onPressed});

  /// Defaults to popping the current route.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CircleIconButton(
      background: colors.surfaceHigh,
      semanticLabel: context.l10n.commonBack,
      onTap: onPressed ?? () => Navigator.of(context).maybePop<void>(),
      child: AppIcon(AppIconData.chevronLeft, color: colors.textPrimary),
    );
  }
}
