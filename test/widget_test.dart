import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/core/l10n/failure_l10n.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/features/room/domain/entities/alias.dart';
import 'package:rumour/features/room/domain/room_code.dart';
import 'package:rumour/features/room/presentation/utils/room_formatters.dart';

void main() {
  group('RoomCode', () {
    test('validates 6 digit codes', () {
      expect(RoomCode.isValid('123456'), isTrue);
      expect(RoomCode.isValid('12345'), isFalse);
      expect(RoomCode.isValid('12a456'), isFalse);
    });

    test('sanitize strips non-digits and clamps length', () {
      expect(RoomCode.sanitize(' 12-34 56 78'), '123456');
    });
  });

  test('Alias formats display name, lines and handle', () {
    const alias = Alias(firstName: 'Seán', lastName: "O'Brien-Smith");
    expect(alias.displayName, "Seán O'Brien-Smith");
    expect(alias.displayLines, ['Seán', "O'Brien-Smith"]);
    expect(alias.handle, 'SeánOBrienSmith');
  });

  group('localized copy', () {
    final l10n = lookupAppLocalizations(const Locale('en'));

    test('RoomFormatters', () {
      expect(RoomFormatters.title(l10n, '581200'), 'Room #581200');
      expect(RoomFormatters.members(l10n, 0), 'New room');
      expect(RoomFormatters.members(l10n, 1), '1 member');
      expect(RoomFormatters.members(l10n, 4), '4 members');
    });

    test('failures map to user-facing text', () {
      expect(const Failure.network().localize(l10n), l10n.errorNetwork);
      expect(
        const Failure.validation(
          reason: ValidationReason.invalidRoomCode,
        ).localize(l10n),
        'Enter all 6 digits of the room code.',
      );
    });
  });
}
