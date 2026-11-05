import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Why a [Failure.validation] happened — the UI maps each to a localized text.
enum ValidationReason { invalidRoomCode, emptyMessage, messageTooLong }

/// Domain level error returned by repositories inside a [Result].
///
/// Failures are *typed*, not sentences: the presentation layer turns them
/// into localized copy (see `FailureL10n`). [debugMessage] carries the raw
/// technical detail for logs only — never show it to users.
@freezed
sealed class Failure with _$Failure {
  const factory Failure.network({String? debugMessage}) = NetworkFailure;

  const factory Failure.server({String? debugMessage}) = ServerFailure;

  const factory Failure.permissionDenied({String? debugMessage}) =
      PermissionFailure;

  const factory Failure.rateLimited({String? debugMessage}) =
      RateLimitedFailure;

  const factory Failure.validation({
    required ValidationReason reason,
    String? debugMessage,
  }) = ValidationFailure;

  const factory Failure.unexpected({String? debugMessage}) = UnexpectedFailure;
}
