import '../constants/app_constants.dart';
import '../error/failures.dart';
import 'gen/app_localizations.dart';

/// Single place that turns typed [Failure]s into user-facing copy.
extension FailureL10n on Failure {
  String localize(AppLocalizations l10n) => switch (this) {
        NetworkFailure() => l10n.errorNetwork,
        ServerFailure() => l10n.errorServer,
        PermissionFailure() => l10n.errorPermission,
        RateLimitedFailure() => l10n.errorRateLimited,
        UnexpectedFailure() => l10n.errorUnexpected,
        ValidationFailure(:final reason) => switch (reason) {
            ValidationReason.invalidRoomCode =>
              l10n.errorInvalidRoomCode(AppConstants.roomCodeLength),
            ValidationReason.emptyMessage => l10n.errorEmptyMessage,
            ValidationReason.messageTooLong =>
              l10n.errorMessageTooLong(AppConstants.maxMessageLength),
          },
      };
}
