import 'package:rumour/core/constants/app_constants.dart';
import 'package:rumour/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract interface class UserLocalDataSource {
  String? readUserId();
  Future<void> writeUserId(String id);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  const UserLocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  String? readUserId() => _prefs.getString(StorageKeys.deviceUserId);

  @override
  Future<void> writeUserId(String id) async {
    final ok = await _prefs.setString(StorageKeys.deviceUserId, id);
    if (!ok) throw const CacheException('Could not persist device identity.');
  }
}
