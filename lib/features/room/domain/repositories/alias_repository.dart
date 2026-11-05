import '../../../../core/utils/result.dart';
import '../entities/alias.dart';

abstract interface class AliasRepository {
  /// Generates an alias that is not yet used by anyone in [roomCode].
  Future<Result<Alias>> generateAlias({required String roomCode});
}
