import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/theme.dart';
import '../cubit/chat_cubit.dart';
import 'message_composer.dart';

/// Composer pinned to the bottom with keyboard / home-indicator aware
/// padding (Figma: 16pt gutters, sits 2pt above the home indicator).
class ChatComposerBar extends StatelessWidget {
  const ChatComposerBar({super.key});

  /// Figma: 18pt between the last bubble area and the composer.
  static const double _topGap = 18;

  @override
  Widget build(BuildContext context) {
    final keyboardOpen = MediaQuery.viewInsetsOf(context).bottom > 0;
    final safeBottom = MediaQuery.viewPaddingOf(context).bottom;
    final bottom = keyboardOpen
        ? AppSpacing.md
        : math.max(safeBottom + AppSpacing.xxs, AppSpacing.lg);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.listGutter,
        _topGap,
        AppSpacing.listGutter,
        bottom,
      ),
      child: MessageComposer(onSend: context.read<ChatCubit>().send),
    );
  }
}
