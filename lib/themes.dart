import 'package:bible_depth/ui/resources/app_fonts.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData light() {
    ColorScheme colorScheme = const ColorScheme.light(
      primary: Color(0xFF7BB8AD),
      background: Color(0xFFFAFAFA),
      inversePrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFA85E58),
    );

    TextTheme textTheme = TextTheme(
      titleLarge: AppFonts.montserratMedium24,
      titleMedium: AppFonts.montserratMedium20,
      titleSmall: AppFonts.montserratMedium16,
      bodyLarge: AppFonts.montserratRegula26,
      bodyMedium: AppFonts.montserratRegula22,
      bodySmall: AppFonts.montserratRegula16,
    );

    AppBarTheme appBarTheme = AppBarTheme(
      centerTitle: false,
      titleTextStyle: textTheme.titleMedium,
      backgroundColor: colorScheme.background,
    );

    FloatingActionButtonThemeData floatingActionButtonThemeData =
        const FloatingActionButtonThemeData(
      shape: CircleBorder(),
    );

    ThemeData themeData = ThemeData(
      colorScheme: colorScheme,
      floatingActionButtonTheme: floatingActionButtonThemeData,
      useMaterial3: true,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.background,
      appBarTheme: appBarTheme,
    );

    return themeData;
  }
}
