import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/widgets/buttons/primary_button.dart';
import '../cubit/identity_cubit.dart';

/// "Acknowledge and continue" / "Try again" CTA bound to [IdentityCubit].
class IdentityActionButton extends StatelessWidget {
  const IdentityActionButton({super.key});

  static String _label(AppLocalizations l10n, IdentityAction action) =>
      switch (action) {
        IdentityAction.retry => l10n.commonTryAgain,
        IdentityAction.acknowledge || IdentityAction.none =>
          l10n.identityAcknowledge,
      };

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<IdentityCubit>();
    return BlocBuilder<IdentityCubit, IdentityState>(
      buildWhen: (a, b) => a.action != b.action || a.isJoining != b.isJoining,
      builder: (context, state) => PrimaryButton(
        label: _label(context.l10n, state.action),
        isLoading: state.isJoining,
        onPressed:
            state.action == IdentityAction.none ? null : cubit.onPrimaryAction,
      ),
    );
  }
}
