import 'package:flutter/material.dart';
import 'package:rumour/core/utils/result.dart';

abstract interface class ThemeRepository {
  ThemeMode loadThemeMode();

  Future<Result<void>> saveThemeMode(ThemeMode mode);
}
