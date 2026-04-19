import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workiom_signup/core/storage/secure_storage.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._storage) : super(ThemeMode.system) {
    unawaited(_hydrate());
  }

  final SecureStorage _storage;

  Future<void> _hydrate() async {
    final saved = await _storage.readThemeMode();
    if (saved == null) return;
    final mode = ThemeMode.values.firstWhere(
      (m) => m.name == saved,
      orElse: () => ThemeMode.system,
    );
    emit(mode);
  }

  Future<void> setMode(ThemeMode mode) async {
    await _storage.writeThemeMode(mode.name);
    emit(mode);
  }
}
