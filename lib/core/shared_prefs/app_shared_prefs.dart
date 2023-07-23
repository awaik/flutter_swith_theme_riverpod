import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  static AppSharedPrefs? _instance;
  static SharedPreferences? _prefs;

  factory AppSharedPrefs() {
    if (_instance == null) {
      throw Exception('AppSharedPrefs is not initialized. '
          'Please call AppSharedPrefs.ensureInitialized before.');
    }
    return _instance!;
  }

  const AppSharedPrefs._();

  static ensureInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
    _instance ??= const AppSharedPrefs._();
  }

  static const _themeKey = 'theme';

  ThemeMode themeMode() {
    final themeValue = _prefs!.getInt(_themeKey);
    if (themeValue == null) return ThemeMode.system;

    return ThemeMode.values[themeValue];
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    await _prefs!.setInt(_themeKey, theme.index);
  }
}
