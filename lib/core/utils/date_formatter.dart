import 'package:intl/intl.dart';

/// How far a date is from today — the UI turns this into localized copy.
enum RelativeDay { today, yesterday, thisWeek, older }

/// Locale-aware date helpers. Pure functions; no user-facing English here.
abstract final class DateFormatter {
  /// "12:00" (24h, as in the design).
  static String time(DateTime date, {String? locale}) =>
      DateFormat('HH:mm', locale).format(date.toLocal());

  /// "Monday"
  static String weekday(DateTime date, {String? locale}) =>
      DateFormat.EEEE(locale).format(date.toLocal());

  /// "3 Nov 2026" (order follows the locale).
  static String date(DateTime date, {String? locale}) =>
      DateFormat.yMMMd(locale).format(date.toLocal());

  static RelativeDay relativeDay(DateTime date, {DateTime? now}) {
    final today = dayOnly(now ?? DateTime.now());
    final diff = today.difference(dayOnly(date.toLocal())).inDays;
    if (diff == 0) return RelativeDay.today;
    if (diff == 1) return RelativeDay.yesterday;
    if (diff > 1 && diff < 7) return RelativeDay.thisWeek;
    return RelativeDay.older;
  }

  static bool isSameDay(DateTime a, DateTime b) {
    final la = a.toLocal();
    final lb = b.toLocal();
    return la.year == lb.year && la.month == lb.month && la.day == lb.day;
  }

  static DateTime dayOnly(DateTime d) => DateTime(d.year, d.month, d.day);
}
