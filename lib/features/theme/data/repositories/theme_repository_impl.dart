import 'package:flutter/material.dart';
import 'package:rumour/core/error/error_mapper.dart';
import 'package:rumour/core/utils/result.dart';
import 'package:rumour/features/theme/data/datasources/theme_local_data_source.dart';
import 'package:rumour/features/theme/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  const ThemeRepositoryImpl(this._local);

  final ThemeLocalDataSource _local;

  @override
  ThemeMode loadThemeMode() {
    final stored = _local.readThemeMode();
    return ThemeMode.values.firstWhere(
      (m) => m.name == stored,
      orElse: () => ThemeMode.dark,
    );
  }

  @override
  Future<Result<void>> saveThemeMode(ThemeMode mode) async {
    try {
      await _local.writeThemeMode(mode.name);
      return const Ok(null);
    } catch (e) {
      return Err(ErrorMapper.toFailure(e));
    }
  }
}
