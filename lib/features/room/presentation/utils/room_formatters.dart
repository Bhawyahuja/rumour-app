
import 'package:rumour/core/l10n/gen/app_localizations.dart';

abstract final class RoomFormatters {
  static String title(AppLocalizations l10n, String code) => l10n.roomTitle(code);

  static String members(AppLocalizations l10n, int count) =>
      l10n.roomMembers(count);
}
