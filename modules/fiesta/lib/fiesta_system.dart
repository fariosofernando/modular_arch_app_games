library fiesta_system;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

export 'fiesta_system.dart' show FiestaSystem;

class FiestaSystem {
  FiestaSystem._();

  static Future<Box> moduleInitializer({String? boxName}) async {
    await Hive.initFlutter();
    return await Hive.openBox(boxName ?? 'settings');
  }

  static SystemUiOverlayStyle systemUiOverlayStyle(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: true);
    final currentTheme = themeNotifier.currentThemeMode;

    bool isDarkMode;

    switch (currentTheme) {
      case ThemeMode.dark:
        isDarkMode = true;
        break;
      case ThemeMode.light:
        isDarkMode = false;
        break;
      case ThemeMode.system:
      default:
        isDarkMode = (Theme.of(context).brightness == Brightness.dark);
        break;
    }

    return SystemUiOverlayStyle(
      systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
      statusBarColor: Theme.of(context).scaffoldBackgroundColor,
      systemNavigationBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    );
  }

  static ColorScheme get lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF346A21),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFB5F399),
        onPrimaryContainer: Color(0xFF042100),
        secondary: Color(0xFF326B23),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFB3F39B),
        onSecondaryContainer: Color(0xFF022100),
        tertiary: Color(0xFF386667),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFBCEBED),
        onTertiaryContainer: Color(0xFF002021),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFFDFDF6),
        onBackground: Color(0xFF1A1C18),
        surface: Color(0xFFFDFDF6),
        onSurface: Color(0xFF1A1C18),
        surfaceVariant: Color(0xFFDFE4D7),
        onSurfaceVariant: Color(0xFF43483F),
        outline: Color(0xFF73796E),
        onInverseSurface: Color(0xFFF1F1EA),
        inverseSurface: Color(0xFF2F312D),
        inversePrimary: Color(0xFF9AD680),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF346A21),
        outlineVariant: Color(0xFFC3C8BB),
        scrim: Color(0xFF000000),
      );

  static ColorScheme get darkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF9AD680),
        onPrimary: Color(0xFF0B3900),
        primaryContainer: Color(0xFF1C5209),
        onPrimaryContainer: Color(0xFFB5F399),
        secondary: Color(0xFF98D782),
        onSecondary: Color(0xFF063900),
        secondaryContainer: Color(0xFF19520C),
        onSecondaryContainer: Color(0xFFB3F39B),
        tertiary: Color(0xFFA0CFD0),
        onTertiary: Color(0xFF003738),
        tertiaryContainer: Color(0xFF1E4E4F),
        onTertiaryContainer: Color(0xFFBCEBED),
        error: Color(0xFFFFB4AB),
        errorContainer: Color(0xFF93000A),
        onError: Color(0xFF690005),
        onErrorContainer: Color(0xFFFFDAD6),
        background: Color(0xFF1A1C18),
        onBackground: Color(0xFFE3E3DC),
        surface: Color(0xFF1A1C18),
        onSurface: Color(0xFFE3E3DC),
        surfaceVariant: Color(0xFF43483F),
        onSurfaceVariant: Color(0xFFC3C8BB),
        outline: Color(0xFF8D9387),
        onInverseSurface: Color(0xFF1A1C18),
        inverseSurface: Color(0xFFE3E3DC),
        inversePrimary: Color(0xFF346A21),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF9AD680),
        outlineVariant: Color(0xFF43483F),
        scrim: Color(0xFF000000),
      );
}

enum ThemeModeSetting { dark, light, system }

class ThemeNotifier extends ValueNotifier<String> {
  final Box _box;

  ThemeNotifier(this._box)
      : super(_box.get('themeMode') ?? ThemeModeSetting.system.name);

  ThemeModeSetting get currentSetting {
    switch (value) {
      case "dark":
        return ThemeModeSetting.dark;
      case "light":
        return ThemeModeSetting.light;
      case "system":
      default:
        return ThemeModeSetting.system;
    }
  }

  ThemeMode get currentThemeMode {
    switch (value) {
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
      case "system":
      default:
        return ThemeMode.system;
    }
  }

  void toggleTheme(String newTheme) {
    value = newTheme;
    _box.put('themeMode', newTheme);
  }
}
