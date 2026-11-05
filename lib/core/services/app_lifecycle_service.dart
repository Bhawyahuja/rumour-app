import 'package:flutter/widgets.dart';

/// Exposes whether the app is currently visible to the user.
abstract interface class AppLifecycleService {
  bool get isInForeground;
  void dispose();
}

class AppLifecycleServiceImpl implements AppLifecycleService {
  AppLifecycleServiceImpl() {
    _state = WidgetsBinding.instance.lifecycleState ?? AppLifecycleState.resumed;
    _listener = AppLifecycleListener(onStateChange: (s) => _state = s);
  }

  late final AppLifecycleListener _listener;
  late AppLifecycleState _state;

  @override
  bool get isInForeground => _state == AppLifecycleState.resumed;

  @override
  void dispose() => _listener.dispose();
}
