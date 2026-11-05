import 'package:rumour/features/user/data/datasources/user_local_data_source.dart';
import 'package:rumour/features/user/domain/repositories/user_repository.dart';
import 'package:uuid/uuid.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._local, {Uuid uuid = const Uuid()}) : _uuid = uuid;

  final UserLocalDataSource _local;
  final Uuid _uuid;
  String? _cached;

  @override
  Future<String> ensureUserId() async {
    final cached = _cached ?? _local.readUserId();
    if (cached != null && cached.isNotEmpty) return _cached = cached;

    final id = _uuid.v4();
    await _local.writeUserId(id);
    return _cached = id;
  }

  @override
  String get currentUserId {
    final id = _cached;
    if (id == null) {
      throw StateError('UserRepository.ensureUserId() was not awaited.');
    }
    return id;
  }
}
