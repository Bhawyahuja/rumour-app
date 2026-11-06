import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rumour/core/l10n/l10n.dart';

/// Local (on-device) notifications for new chat messages.
abstract interface class NotificationService {
  Future<void> init();

  /// Asks for the runtime permission (Android 13+, iOS). Returns `true` when
  /// notifications may be shown.
  Future<bool> requestPermission();

  Future<void> showChatMessage({
    required String roomCode,
    required String sender,
    required String text,
  });
}

class LocalNotificationService implements NotificationService {
  LocalNotificationService([FlutterLocalNotificationsPlugin? plugin])
      : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialised = false;

  static const String _channelId = 'chat_messages';

  AppLocalizations get _l10n => lookupAppLocalizations(
        basicLocaleListResolution(
          PlatformDispatcher.instance.locales,
          AppLocalizations.supportedLocales,
        ),
      );

  @override
  Future<void> init() async {
    if (_initialised) return;
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@drawable/ic_notification'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      ),
    );
    try {
      await _plugin.initialize(settings);
      _initialised = true;
    } catch (e) {
      // Notifications are a nice-to-have; never crash the app because of them.
      debugPrint('Notifications unavailable: $e');
    }
  }

  @override
  Future<bool> requestPermission() async {
    if (!_initialised) return false;
    try {
      final android = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      if (android != null) {
        return await android.requestNotificationsPermission() ?? false;
      }
      final ios = _plugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();
      if (ios != null) {
        return await ios.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            ) ??
            false;
      }
    } catch (e) {
      debugPrint('Notification permission request failed: $e');
    }
    return false;
  }

  @override
  Future<void> showChatMessage({
    required String roomCode,
    required String sender,
    required String text,
  }) async {
    if (!_initialised) return;
    final l10n = _l10n;
    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        l10n.notificationChannelName,
        channelDescription: l10n.notificationChannelDescription,
        importance: Importance.high,
        priority: Priority.high,
        category: AndroidNotificationCategory.message,
        groupKey: 'room_$roomCode',
        styleInformation: BigTextStyleInformation(text),
      ),
      iOS: DarwinNotificationDetails(threadIdentifier: 'room_$roomCode'),
    );
    try {
      await _plugin.show(
        // Unique-ish id so consecutive messages do not overwrite each other.
        DateTime.now().millisecondsSinceEpoch.remainder(1 << 31),
        l10n.notificationTitle(sender, roomCode),
        text,
        details,
        payload: roomCode,
      );
    } catch (e) {
      debugPrint('Failed to show notification: $e');
    }
  }
}
