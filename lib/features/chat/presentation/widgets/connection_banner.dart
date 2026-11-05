import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/core/widgets/loaders/pulsing_dots.dart';
import 'package:rumour/features/chat/presentation/cubit/chat_cubit.dart';

class ConnectionBanner extends StatelessWidget {
  const ConnectionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocSelector<ChatCubit, ChatState, bool>(
      selector: (s) => s.isOffline,
      builder: (context, offline) => AnimatedSize(
        duration: AppDurations.medium,
        curve: AppCurves.standard,
        child: !offline
            ? const SizedBox(width: double.infinity)
            : Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.pageGutter,
                  AppSpacing.md,
                  AppSpacing.pageGutter,
                  0,
                ),
                child: Semantics(
                  liveRegion: true,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    decoration: BoxDecoration(
                      color: colors.surfaceHigh,
                      borderRadius: AppRadius.mdAll,
                    ),
                    child: Row(
                      children: [
                        PulsingDots(
                          size: 5,
                          spacing: AppSpacing.xs,
                          color: colors.textMuted,
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            context.  l10n.chatOfflineBanner,
                            style: context.text.labelSmall?.copyWith(
                              color: colors.textMuted,
                            ),
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
