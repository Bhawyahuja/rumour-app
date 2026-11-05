import 'package:flutter/material.dart';
import 'package:rumour/features/chat/presentation/widgets/chat_body.dart';
import 'package:rumour/features/chat/presentation/widgets/chat_composer_bar.dart';
import 'package:rumour/features/chat/presentation/widgets/chat_notice_listener.dart';
import 'package:rumour/features/chat/presentation/widgets/connection_banner.dart';
import 'package:rumour/features/room/presentation/widgets/room_header.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatNoticeListener(
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              RoomHeader(),
              ConnectionBanner(),
              Expanded(child: ChatBody()),
              ChatComposerBar(),
            ],
          ),
        ),
      ),
    );
  }
}
