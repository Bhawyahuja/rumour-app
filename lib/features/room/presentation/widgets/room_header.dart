import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/buttons/app_back_button.dart';
import 'room_header_title.dart';

/// Header shared by the identity and chat screens.
///
/// Requires a `RoomInfoCubit` above it in the tree.
class RoomHeader extends StatelessWidget {
  const RoomHeader({super.key, this.onBack});

  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.pageGutter,
        AppSpacing.screenTop,
        AppSpacing.pageGutter,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBackButton(onPressed: onBack),
          const RoomHeaderTitle(),
          const SizedBox(
            width: AppSizes.iconButton,
            height: AppSizes.iconButton,
          ),
        ],
      ),
    );
  }
}
