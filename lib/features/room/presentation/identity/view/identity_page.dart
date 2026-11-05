import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumour/app/router/app_router.dart';
import 'package:rumour/core/l10n/failure_l10n.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/core/widgets/animations/entrance.dart';
import 'package:rumour/core/widgets/feedback/app_snackbar.dart';
import 'package:rumour/features/room/presentation/identity/cubit/identity_cubit.dart';
import 'package:rumour/features/room/presentation/identity/widgets/identity_action_button.dart';
import 'package:rumour/features/room/presentation/identity/widgets/identity_card.dart';
import 'package:rumour/features/room/presentation/widgets/room_header.dart';

class IdentityPage extends StatelessWidget {
  const IdentityPage({super.key});

  void _onState(BuildContext context, IdentityState state) {
    if (state case IdentityJoined(:final member)) {
      Navigator.of(context).pushReplacementNamed(
        AppRoutes.chat,
        arguments: ChatArgs(member: member),
      );
    } else if (state.joinError case final failure?) {
      AppSnackBar.error(context, failure.localize(context.l10n));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return Scaffold(
      body: BlocListener<IdentityCubit, IdentityState>(
        listener: _onState,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const RoomHeader(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.pageGutter,
                ),
                child: Entrance(
                  offset: const Offset(0, 0.08),
                  child: BlocBuilder<IdentityCubit, IdentityState>(
                    buildWhen: (a, b) =>
                        a.currentAlias != b.currentAlias ||
                        a.generationError != b.generationError,
                    builder: (context, state) => IdentityCard(
                      alias: state.currentAlias,
                      error: state.generationError,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: _Layout.cardToButton),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.pageGutter,
                ),
                child: Entrance(
                  delay: AppDurations.instant,
                  offset: Offset(0, 0.4),
                  child: IdentityActionButton(),
                ),
              ),
              SizedBox(height: bottomInset + _Layout.buttonBottom),
            ],
          ),
        ),
      ),
    );
  }
}

/// Figma offsets specific to this screen.
abstract final class _Layout {
  static const double cardToButton = 34;
  static const double buttonBottom = 21;
}
