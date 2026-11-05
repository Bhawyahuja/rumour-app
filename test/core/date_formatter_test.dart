import 'package:flutter_test/flutter_test.dart';
import 'package:rumour/core/utils/date_formatter.dart';

void main() {
  final now = DateTime(2026, 11, 5, 18);

  test('relative days', () {
    expect(
      DateFormatter.relativeDay(DateTime(2026, 11, 5, 9), now: now),
      RelativeDay.today,
    );
    expect(
      DateFormatter.relativeDay(DateTime(2026, 11, 4, 23), now: now),
      RelativeDay.yesterday,
    );
    expect(
      DateFormatter.relativeDay(DateTime(2026, 11, 2), now: now),
      RelativeDay.thisWeek,
    );
    expect(
      DateFormatter.relativeDay(DateTime(2026, 10), now: now),
      RelativeDay.older,
    );
  });

  test('time is 24h HH:mm', () {
    expect(DateFormatter.time(DateTime(2026, 1, 1, 12)), '12:00');
    expect(DateFormatter.time(DateTime(2026, 1, 1, 9, 5)), '09:05');
  });
}
