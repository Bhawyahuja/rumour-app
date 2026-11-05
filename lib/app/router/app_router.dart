import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumour/core/di/injection.dart';
import 'package:rumour/core/theme/tokens/app_durations.dart';
import 'package:rumour/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rumour/features/chat/presentation/view/chat_page.dart';
import 'package:rumour/features/room/domain/entities/member.dart';
import 'package:rumour/features/room/presentation/identity/cubit/identity_cubit.dart';
import 'package:rumour/features/room/presentation/identity/view/identity_page.dart';
import 'package:rumour/features/room/presentation/join/cubit/join_room_cubit.dart';
import 'package:rumour/features/room/presentation/join/view/join_room_page.dart';
import 'package:rumour/features/room/presentation/room_info/room_info_cubit.dart';

abstract final class AppRoutes {
  static const String join = '/';
  static const String identity = '/identity';
  static const String chat = '/chat';
}

class IdentityArgs {
  const IdentityArgs({required this.roomCode});

  final String roomCode;
}

class ChatArgs {
  const ChatArgs({required this.member});

  final Member member;
}

abstract final class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final Widget screen = switch (settings.name) {
      AppRoutes.identity when args is IdentityArgs => _identity(args.roomCode),
      AppRoutes.chat when args is ChatArgs => _chat(args.member),
      _ => _join(),
    };
    return _fadeThrough(settings, screen);
  }

  static Widget _join() => BlocProvider(
    create: (_) => getIt<JoinRoomCubit>(),
    child: const JoinRoomPage(),
  );

  static Widget _identity(String roomCode) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => getIt<IdentityCubit>(param1: roomCode)..generate(),
      ),
      BlocProvider(create: (_) => getIt<RoomInfoCubit>(param1: roomCode)),
    ],
    child: const IdentityPage(),
  );

  static Widget _chat(Member member) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => getIt<ChatCubit>(param1: member)..start()),
      BlocProvider(
        create: (_) => getIt<RoomInfoCubit>(param1: member.roomCode),
      ),
    ],
    child: const ChatPage(),
  );

  static PageRoute<T> _fadeThrough<T>(RouteSettings settings, Widget page) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: AppDurations.slow,
      pageBuilder: (_, _, _) => page,
      transitionsBuilder: (context, animation, secondary, child) {
        final inCurve = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        final outCurve = CurvedAnimation(
          parent: secondary,
          curve: Curves.easeInCubic,
        );
        return FadeTransition(
          opacity: inCurve,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.04),
              end: Offset.zero,
            ).animate(inCurve),
            child: ScaleTransition(
              scale: Tween<double>(begin: 1, end: 0.96).animate(outCurve),
              child: FadeTransition(
                opacity: Tween<double>(begin: 1, end: 0.6).animate(outCurve),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
