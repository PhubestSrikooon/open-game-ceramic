import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';

class ThemeConfig {
  final BuildContext context;
  ThemeData currentTheme = ThemeData.light();

  ThemeData loadTheme([Color? color]) {
    currentTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: color ?? SystemTheme.accentColor.accent,
            brightness: MediaQuery.of(context).platformBrightness));
    return currentTheme;
  }

  ThemeConfig(this.context) {
    loadTheme();
  }
}

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  ThemeData getTheme() => _themeData;

  setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
