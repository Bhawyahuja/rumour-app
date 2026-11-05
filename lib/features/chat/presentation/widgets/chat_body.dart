import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/core/l10n/failure_l10n.dart';
import 'package:rumour/core/l10n/l10n.dart';

import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/core/widgets/feedback/state_message_view.dart';
import 'package:rumour/features/chat/presentation/cubit/chat_cubit.dart';

import 'chat_message_list.dart';
import 'chat_skeleton.dart';

/// Switches between skeleton, error, empty and the message list.
class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      buildWhen: (a, b) => a.status != b.status || a.isEmpty != b.isEmpty,
      builder: (context, state) {
        final l10n = context.l10n;
        final Widget child = switch (state.status) {
          ChatStatus.loading => const ChatSkeleton(key: ValueKey('loading')),
          ChatStatus.failure => StateMessageView(
              key: const ValueKey('failure'),
              icon: Icons.cloud_off_rounded,
              title: l10n.chatLoadFailedTitle,
              subtitle: (state.failure ?? const Failure.unexpected())
                  .localize(l10n),
              actionLabel: l10n.commonRetry,
              onAction: context.read<ChatCubit>().start,
            ),
          ChatStatus.ready when state.isEmpty => StateMessageView(
              key: const ValueKey('empty'),
              icon: Icons.chat_bubble_outline_rounded,
              title: l10n.chatEmptyTitle,
              subtitle: l10n.chatEmptySubtitle,
            ),
          ChatStatus.ready => const ChatMessageList(key: ValueKey('list')),
        };

        return AnimatedSwitcher(
          duration: AppDurations.medium,
          switchInCurve: Curves.easeOut,
          child: child,
        );
      },
    );
  }
}
