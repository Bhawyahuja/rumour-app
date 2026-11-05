import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumour/core/theme/tokens/app_durations.dart';
import 'package:rumour/core/theme/tokens/app_spacing.dart';
import 'package:rumour/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rumour/features/chat/presentation/models/chat_item.dart';

import 'chat_item_tile.dart';
import 'history_loader.dart';
import 'scroll_to_latest_button.dart';

class ChatMessageList extends StatefulWidget {
  const ChatMessageList({super.key});

  @override
  State<ChatMessageList> createState() => _ChatMessageListState();
}

class _ChatMessageListState extends State<ChatMessageList> {
  static const double _showJumpButtonAfter = 400;

  final _controller = ScrollController();
  final _showJumpButton = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onScroll)
      ..dispose();
    _showJumpButton.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    final pos = _controller.position;
    _showJumpButton.value = pos.pixels > _showJumpButtonAfter;
    context.read<ChatCubit>().onScroll(
      offset: pos.pixels,
      maxExtent: pos.maxScrollExtent,
    );
  }

  void _scrollToLatest() {
    if (!_controller.hasClients || _controller.offset == 0) return;
    // Long jumps are instant-ish; short ones animate smoothly.
    final far = _controller.offset > 3000;
    if (far) _controller.jumpTo(600);
    _controller.animateTo(
      0,
      duration: AppDurations.medium,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(
      listenWhen: (a, b) => a.scrollToLatestTick != b.scrollToLatestTick,
      listener: (_, _) => _scrollToLatest(),
      child: Stack(
        children: [
          BlocBuilder<ChatCubit, ChatState>(
            buildWhen: (a, b) =>
                a.items != b.items || a.isLoadingMore != b.isLoadingMore,
            builder: (context, state) => _List(
              controller: _controller,
              items: state.items,
              isLoadingMore: state.isLoadingMore,
            ),
          ),
          Positioned(
            right: 16,
            bottom: 12,
            child: ValueListenableBuilder<bool>(
              valueListenable: _showJumpButton,
              builder: (context, visible, _) =>
                  BlocSelector<ChatCubit, ChatState, int>(
                    selector: (s) => s.unreadCount,
                    builder: (context, unread) => ScrollToLatestButton(
                      visible: visible || (unread > 0 && _isScrolledUp),
                      unreadCount: unread,
                      onPressed: _scrollToLatest,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  bool get _isScrolledUp =>
      _controller.hasClients &&
      _controller.offset > ChatCubit.atLatestThreshold;
}

class _List extends StatelessWidget {
  const _List({
    required this.controller,
    required this.items,
    required this.isLoadingMore,
  });

  final ScrollController controller;
  final List<ChatItem> items;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      reverse: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.only(
        top: AppSpacing.lg,
        bottom: AppSpacing.xxl,
      ),
      itemCount: items.length + (isLoadingMore ? 1 : 0),
      // Stable keys keep row state when new messages are inserted at index 0.
      findChildIndexCallback: (key) {
        if (key is! ValueKey<String>) return null;
        final index = items.indexWhere((i) => i.key == key.value);
        return index < 0 ? null : index;
      },
      itemBuilder: (context, index) {
        if (index == items.length) return const HistoryLoader();
        final item = items[index];
        return ChatItemTile(key: ValueKey<String>(item.key), item: item);
      },
    );
  }
}
