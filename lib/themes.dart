import 'package:flutter/material.dart';

class Themes {
  static ThemeData light() {
    ColorScheme colorScheme = const ColorScheme.light(
      primary: Color(0xFF7BB8AD),
      background: Color(0xFFFAFAFA),
      inversePrimary: Color(0xFFFFFFFF),
    );

    TextTheme textTheme = const TextTheme(
        titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ));

    AppBarTheme appBarTheme = AppBarTheme(
      centerTitle: false,
      titleTextStyle: textTheme.titleLarge,
      backgroundColor: colorScheme.background,
    );

    ThemeData themeData = ThemeData(
      colorScheme: colorScheme,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(shape: CircleBorder()),
      useMaterial3: true,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.background,
      appBarTheme: appBarTheme,
    );

    return themeData;
  }
}
