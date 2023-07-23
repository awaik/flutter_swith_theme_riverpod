import 'package:flutter/material.dart';
import 'package:flutter_swith_theme_riverpod/core/shared_prefs/app_shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeState extends _$ThemeState {
  @override
  ThemeMode build() {
    return AppSharedPrefs().themeMode();
  }

  ThemeMode getTheme() {
    return state;
  }

  void setTheme() {
    if (state == ThemeMode.dark) {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.dark;
    }
    AppSharedPrefs().updateThemeMode(state);
  }
}
