import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumour/features/theme/domain/repositories/theme_repository.dart';


class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._repository) : super(_repository.loadThemeMode());

  final ThemeRepository _repository;

  Future<void> toggle(Brightness currentBrightness) async {
    final next = currentBrightness == Brightness.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    await setMode(next);
  }

  Future<void> setMode(ThemeMode mode) async {
    if (mode == state) return;
    emit(mode);
    await _repository.saveThemeMode(mode);
  }
}
