import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rumour/core/theme/theme.dart';
import 'package:rumour/features/chat/presentation/utils/participant_color.dart';

void main() {
  test('same user always gets the same colour', () {
    final a = ParticipantColor.indexOf('seed-user-1', 7);
    expect(ParticipantColor.indexOf('seed-user-1', 7), a);
    expect(a, inInclusiveRange(0, 6));
  });

  test('stable across releases (known FNV-1a results)', () {
    // Regression guard: changing the hash would recolour everyone.
    expect(
      [for (var i = 1; i <= 6; i++) ParticipantColor.indexOf('seed-user-$i', 7)],
      [5, 0, 2, 4, 6, 1],
    );
  });

  test('users spread over the palette', () {
    final used = {
      for (var i = 0; i < 50; i++) ParticipantColor.indexOf('user-$i', 7),
    };
    expect(used.length, greaterThan(4));
  });

  test('palettes have 7 colours and no lime (own-message colour)', () {
    for (final tokens in [AppColorTokens.dark, AppColorTokens.light]) {
      expect(tokens.participantColors, hasLength(7));
      expect(tokens.participantColors, isNot(contains(tokens.primary)));
      expect(tokens.participantColors, isNot(contains(const Color(0xFFA3E635))));
    }
  });
}
