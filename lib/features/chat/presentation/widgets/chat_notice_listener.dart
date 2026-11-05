import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumour/core/l10n/failure_l10n.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/widgets/feedback/app_snackbar.dart';
import 'package:rumour/features/chat/presentation/cubit/chat_cubit.dart';

class ChatNoticeListener extends StatelessWidget {
  const ChatNoticeListener({super.key, required this.child});

  final Widget child;

  static void _show(BuildContext context, ChatNotice notice) {
    final l10n = context.l10n;
    switch (notice) {
      case ChatNoticeCopied():
        AppSnackBar.success(context, l10n.chatMessageCopied);
      case ChatNoticeCopyFailed():
        AppSnackBar.error(context, l10n.chatCopyFailed);
      case ChatNoticeFailure(:final failure):
        AppSnackBar.error(context, failure.localize(l10n));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(
      listenWhen: (a, b) => a.noticeId != b.noticeId && b.notice != null,
      listener: (context, state) => _show(context, state.notice!),
      child: child,
    );
  }
}
