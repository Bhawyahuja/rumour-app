import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/utils/date_formatter.dart';
import 'package:rumour/core/widgets/animations/slide_fade_in.dart';
import 'package:rumour/features/chat/presentation/models/chat_item.dart';
import 'package:rumour/features/chat/presentation/utils/chat_metrics.dart';
import 'package:rumour/features/chat/presentation/widgets/message_bubble.dart';
import 'package:rumour/features/chat/presentation/widgets/sender_label.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({super.key, required this.item, required this.onLongPress});

  final ChatMessageItem item;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    final message = item.message;
    final mine = message.isMine;
    final l10n = context.l10n;

    return SlideFadeIn(
      animate: item.animateIn,
      from: Offset(mine ? 0.12 : -0.12, 0.25),
      child: Padding(
        padding: ChatMetrics.rowPadding(mine: mine, top: item.topSpacing),
        child: Column(
          crossAxisAlignment: mine
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            if (item.showSender)
              SenderLabel(
                text: mine
                    ? l10n.chatYou
                    : l10n.chatHandle(message.senderHandle),
              ),
            Semantics(
              label: l10n.chatMessageSemantics(
                mine ? l10n.chatYou : message.senderAlias,
                message.text,
                DateFormatter.time(message.createdAt),
              ),
              hint: l10n.chatCopyHint,
              excludeSemantics: true,
              child: GestureDetector(
                onLongPress: () {
                  HapticFeedback.selectionClick();
                  onLongPress();
                },
                child: MessageBubble(message: message),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
