import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/theme_context.dart';
import 'package:rumour/core/theme/tokens/app_durations.dart';
import 'package:rumour/core/theme/tokens/app_radius.dart';
import 'package:rumour/core/theme/tokens/app_spacing.dart';
import 'package:rumour/core/widgets/loaders/shimmer.dart';
import 'package:rumour/features/room/presentation/room_info/room_info_cubit.dart';
import 'package:rumour/features/room/presentation/utils/room_formatters.dart';

class RoomHeaderTitle extends StatelessWidget {
  const RoomHeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    return BlocBuilder<RoomInfoCubit, RoomInfoState>(
      builder: (context, state) {
        final members = RoomFormatters.members(l10n, state.room.memberCount);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              RoomFormatters.title(l10n, state.room.code),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.text.titleLarge?.copyWith(
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.xxs),
            SizedBox(
              child: AnimatedSwitcher(
                duration: AppDurations.medium,
                transitionBuilder: (child, a) => FadeTransition(
                  opacity: a,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.4),
                      end: Offset.zero,
                    ).animate(a),
                    child: child,
                  ),
                ),
                child: state.isLoaded
                    ? Text(
                        members,
                        key: ValueKey(members),
                        style: context.text.titleSmall?.copyWith(
                          color: colors.textMuted,
                        ),
                      )
                    : const Shimmer(
                        key: ValueKey('loading'),
                        child: ShimmerBox(
                          width: 64,
                          height: AppSpacing.md,
                          radius: AppRadius.sm,
                        ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
