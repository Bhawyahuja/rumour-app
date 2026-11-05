// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Rumour';

  @override
  String get commonBack => 'Back';

  @override
  String get commonLoading => 'Loading';

  @override
  String get commonRetry => 'Retry';

  @override
  String get commonTryAgain => 'Try again';

  @override
  String get themeSwitchToLight => 'Switch to light mode';

  @override
  String get themeSwitchToDark => 'Switch to dark mode';

  @override
  String get joinTitle => 'Join A Room';

  @override
  String get joinSubtitle => 'Enter the code to join the anon chat room';

  @override
  String get joinCodeFieldLabel => 'Room code';

  @override
  String get joinChecking => 'Checking room';

  @override
  String get identityCaption => 'For this room, you are';

  @override
  String get identityDescription =>
      'This is your anonymous identifier, visible only to others in this room.';

  @override
  String get identityGenerating => 'Generating your anonymous name';

  @override
  String get identityAcknowledge => 'Acknowledge and continue';

  @override
  String roomTitle(String code) {
    return 'Room #$code';
  }

  @override
  String roomMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
      zero: 'New room',
    );
    return '$_temp0';
  }

  @override
  String get chatYou => 'You';

  @override
  String chatHandle(String handle) {
    return '@$handle';
  }

  @override
  String chatMessageSemantics(String sender, String text, String time) {
    return '$sender said $text at $time';
  }

  @override
  String get chatCopyHint => 'Long press to copy';

  @override
  String get chatMessageCopied => 'Message copied';

  @override
  String get chatCopyFailed => 'Could not copy the message';

  @override
  String get chatComposerHint => 'Type a message';

  @override
  String get chatSend => 'Send message';

  @override
  String get chatLoadingOlder => 'Loading older messages';

  @override
  String get chatLoadFailedTitle => 'Couldn\'t load messages';

  @override
  String get chatEmptyTitle => 'No rumours yet';

  @override
  String get chatEmptySubtitle =>
      'Say something — everyone here only sees your alias.';

  @override
  String chatScrollToLatest(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Scroll to latest, $count new messages',
      one: 'Scroll to latest, 1 new message',
      zero: 'Scroll to latest',
    );
    return '$_temp0';
  }

  @override
  String get chatOfflineBanner =>
      'Connecting… messages will send once you\'re back online.';

  @override
  String get dayToday => 'Today';

  @override
  String get dayYesterday => 'Yesterday';

  @override
  String get errorNetwork =>
      'You appear to be offline. Check your connection and try again.';

  @override
  String get errorServer => 'Something went wrong. Please try again.';

  @override
  String get errorPermission => 'You are not allowed to do that.';

  @override
  String get errorRateLimited =>
      'Too many requests. Please slow down and try again.';

  @override
  String get errorUnexpected => 'Unexpected error. Please try again.';

  @override
  String errorInvalidRoomCode(int length) {
    return 'Enter all $length digits of the room code.';
  }

  @override
  String get errorEmptyMessage => 'Message is empty.';

  @override
  String errorMessageTooLong(int max) {
    return 'Messages can be at most $max characters.';
  }
}
