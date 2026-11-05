import 'package:flutter/material.dart';
import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/features/chat/presentation/models/chat_item.dart';
import 'package:rumour/features/chat/presentation/utils/day_label.dart';

import 'date_chip.dart';

class DaySeparatorTile extends StatelessWidget {
  const DaySeparatorTile({super.key, required this.item});

  final ChatDaySeparator item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: item.isTopMost ? 0 : AppSpacing.xxl,
        bottom: AppSpacing.xxl,
      ),
      child: DateChip(label: DayLabel.of(context, item.day)),
    );
  }
}
