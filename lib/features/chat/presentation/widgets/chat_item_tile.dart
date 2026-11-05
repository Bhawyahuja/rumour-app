import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/chat_cubit.dart';
import '../models/chat_item.dart';
import 'day_separator_tile.dart';
import 'message_tile.dart';

/// Dispatches a [ChatItem] to its widget.
class ChatItemTile extends StatelessWidget {
  const ChatItemTile({super.key, required this.item});

  final ChatItem item;

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      final ChatDaySeparator day => DaySeparatorTile(item: day),
      final ChatMessageItem msg => MessageTile(
          item: msg,
          onLongPress: () => context.read<ChatCubit>().copyMessage(msg.message),
        ),
    };
  }
}
