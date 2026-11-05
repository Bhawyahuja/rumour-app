import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumour/app/router/app_router.dart';
import 'package:rumour/core/theme/tokens/app_durations.dart';
import 'package:rumour/core/theme/tokens/app_sizes.dart';
import 'package:rumour/core/theme/tokens/app_spacing.dart';
import 'package:rumour/core/widgets/animations/entrance.dart';
import 'package:rumour/features/room/presentation/join/cubit/join_room_cubit.dart';
import 'package:rumour/features/room/presentation/join/widgets/join_header.dart';
import 'package:rumour/features/room/presentation/join/widgets/join_status_line.dart';
import 'package:rumour/features/room/presentation/join/widgets/key_badge.dart';
import 'package:rumour/features/room/presentation/join/widgets/room_code_field.dart';
import 'package:rumour/features/theme/presentation/widgets/theme_toggle_button.dart';

class JoinRoomPage extends StatefulWidget {
  const JoinRoomPage({super.key});

  @override
  State<JoinRoomPage> createState() => _JoinRoomPageState();
}

class _JoinRoomPageState extends State<JoinRoomPage> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(_Layout.autofocusDelay, () {
      if (mounted && (ModalRoute.of(context)?.isCurrent ?? false)) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _navigate(BuildContext context, JoinRoomState state) async {
    final navigator = Navigator.of(context);
    final cubit = context.read<JoinRoomCubit>();
    _focusNode.unfocus();

    switch (state) {
      case JoinRoomNeedsIdentity(:final code):
        await navigator.pushNamed(
          AppRoutes.identity,
          arguments: IdentityArgs(roomCode: code),
        );
      case JoinRoomAlreadyMember(:final member):
        await navigator.pushNamed(
          AppRoutes.chat,
          arguments: ChatArgs(member: member),
        );
      case JoinRoomIdle() || JoinRoomChecking() || JoinRoomFailure():
        return;
    }

    if (!mounted) return;
    _controller.clear();
    cubit.reset();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<JoinRoomCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<JoinRoomCubit, JoinRoomState>(
        listenWhen: (_, next) => next.isNavigation,
        listener: _navigate,
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: AppSpacing.screenTop),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppSizes.iconButton,
                        height: AppSizes.iconButton,
                      ),
                      KeyBadge(),
                      ThemeToggleButton(),
                    ],
                  ),
                  const SizedBox(height: _Layout.badgeToTitle),
                  const JoinHeader(),
                  const SizedBox(height: _Layout.subtitleToField),
                  Entrance(
                    delay: AppDurations.medium,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _Layout.fieldInset,
                      ),
                      child: BlocBuilder<JoinRoomCubit, JoinRoomState>(
                        buildWhen: (a, b) =>
                            a.canEdit != b.canEdit ||
                            a.errorTick != b.errorTick,
                        builder: (context, state) => RoomCodeField(
                          controller: _controller,
                          focusNode: _focusNode,
                          enabled: state.canEdit,
                          hasError: state.error != null,
                          errorTick: state.errorTick,
                          onChanged: cubit.codeChanged,
                          onSubmitted: cubit.submit,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  BlocBuilder<JoinRoomCubit, JoinRoomState>(
                    builder: (context, state) => JoinStatusLine(
                      isChecking: state.isChecking,
                      error: state.error,
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

abstract final class _Layout {
  static const double badgeToTitle = 168;
  static const double subtitleToField = 31;
  static const double fieldInset = 48;
  static const Duration autofocusDelay = Duration(milliseconds: 650);
}
