import 'package:flutter/material.dart';

const Color _primaryColor = Color(0xFF87555c);
const Color _primaryColorDark = Color(0xFF5c383d);

const Map<AppThemeType, Color> _colorsThemes = {
  AppThemeType.light: _primaryColor,
  AppThemeType.dark: _primaryColorDark,
};

enum AppThemeType { light, dark }

class AppTheme {
  final AppThemeType typeTheme;

  const AppTheme({this.typeTheme = AppThemeType.light});

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorsThemes[typeTheme],
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
