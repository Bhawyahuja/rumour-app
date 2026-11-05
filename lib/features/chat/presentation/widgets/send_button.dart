import 'package:flutter/material.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/core/widgets/app_icon.dart';
import 'package:rumour/core/widgets/buttons/pressable_scale.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    required this.enabled,
    required this.onPressed,
    this.size = AppSizes.inputHeight,
  });

  final bool enabled;
  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      button: true,
      enabled: enabled,
      label: context.l10n.chatSend,
      child: PressableScale(
        onTap: enabled ? onPressed : null,
        scale: 0.88,
        child: AnimatedOpacity(
          duration: AppDurations.fast,
          opacity: enabled ? 1 : 0.55,
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.primary,
              shape: BoxShape.circle,
            ),
            child: AnimatedRotation(
              turns: enabled ? 0 : -0.04,
              duration: AppDurations.fast,
              child: AppIcon(
                AppIconData.send,
                size: AppSizes.iconMd,
                color: colors.onPrimaryVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
