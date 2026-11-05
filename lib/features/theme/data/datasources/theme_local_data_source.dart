import 'package:rumour/core/constants/app_constants.dart';
import 'package:rumour/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';



abstract interface class ThemeLocalDataSource {
  String? readThemeMode();
  Future<void> writeThemeMode(String value);
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  const ThemeLocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  String? readThemeMode() => _prefs.getString(StorageKeys.themeMode);

  @override
  Future<void> writeThemeMode(String value) async {
    final ok = await _prefs.setString(StorageKeys.themeMode, value);
    if (!ok) throw const CacheException('Could not save theme preference.');
  }
}
