import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  bool get isDark {
    return _themeMode == ThemeMode.dark;
  }

  void setDarkMode(bool enabled) {
    _themeMode =
        enabled ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }
}

final ThemeController themeController = ThemeController();