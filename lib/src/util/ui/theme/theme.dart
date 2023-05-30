import 'package:flutter/material.dart';
import 'package:my_site/src/util/ui/theme/color_schemes.g.dart.dart';

enum AppTheme {
  purpleLight,
  purpleDark;

  ThemeData get toTheme {
    return switch (this) {
      purpleDark => AppThemeConfig.purpleDark,
      purpleLight => AppThemeConfig.purpleLight,
    };
  }

  static AppTheme deserialize(String? value) {
    AppTheme theme;
    if (value == purpleDark.serialize) {
      theme = purpleDark;
    } else {
      theme = purpleLight;
    }
    return theme;
  }

  static ThemeData get defaultTheme => AppThemeConfig.purpleLight;
  String get serialize => name;
}

extension ThemeModeX on ThemeMode {
  String get serialize => name;

  static ThemeMode deserialize(String? value) {
    ThemeMode themeMode;
    if (value == ThemeMode.dark.serialize) {
      themeMode = ThemeMode.dark;
    } else if (value == ThemeMode.light.serialize) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.system;
    }
    return themeMode;
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
