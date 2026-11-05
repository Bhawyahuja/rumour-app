import 'package:flutter/widgets.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/utils/date_formatter.dart';

abstract final class DayLabel {
  static String of(BuildContext context, DateTime day, {DateTime? now}) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    return switch (DateFormatter.relativeDay(day, now: now)) {
      RelativeDay.today => l10n.dayToday,
      RelativeDay.yesterday => l10n.dayYesterday,
      RelativeDay.thisWeek => DateFormatter.weekday(day, locale: locale),
      RelativeDay.older => DateFormatter.date(day, locale: locale),
    };
  }
}
