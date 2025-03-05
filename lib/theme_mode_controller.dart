import 'package:flutter/material.dart';

// Using ValueNotifier instead of ChangeNotifier
class ThemeModeController {
  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier<ThemeMode>(
    ThemeMode.system,
  );

  ValueNotifier<ThemeMode> get themeMode => _themeMode;

  void updateThemeMode(ThemeMode themeMode) {
    _themeMode.value = themeMode;
  }

  void dispose() {
    _themeMode.dispose();
  }
}

// Using ChangeNotifier instead of ValueNotifier
class ThemeModeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void updateThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
