import 'package:flutter/material.dart';
import 'package:my_site/util/ui/theme/color_schemes.g.dart.dart';

enum AppTheme {
  purpleLight,
  purpleDark;

  ThemeData get toTheme {
    return switch (this) {
      purpleDark => AppThemeConfig.purpleDark,
      purpleLight => AppThemeConfig.purpleLight,
    };
  }
}

class AppThemeConfig {
  const AppThemeConfig();
  static ThemeData purpleLight = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,
  );
  static ThemeData purpleDark = ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: true,
  );
}
