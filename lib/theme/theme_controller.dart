import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool darkMode) {
    _themeMode = darkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

final ThemeController themeController = ThemeController();