import 'package:flutter/widgets.dart';

import 'gen/app_localizations.dart';

export 'gen/app_localizations.dart';

extension L10nContext on BuildContext {
  /// Localized strings: `context.l10n.joinTitle`.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
