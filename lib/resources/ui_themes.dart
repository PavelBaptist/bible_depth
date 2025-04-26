import 'package:bible_depth/resources/color_ui_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UIThemes {
  final Brightness brightness;

  UIThemes({this.brightness = Brightness.light});

  static ThemeData lightTheme() => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor:
            ColorsUIThemes.instance.light.backgroundPrimary,
        // dividerColor: Colors.transparent,
        // dialogTheme: DialogTheme(
        //   elevation: 0,
        //   backgroundColor: ColorsUIThemes.instance.light.backgroundPrimary,
        // ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: ColorsUIThemes.instance.light.darkBeruz,
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          titleTextStyle: TextStyle(
            fontFamily: "Jura",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsUIThemes.instance.light.textPrimary,
          ),
          centerTitle: true,
          backgroundColor: ColorsUIThemes.instance.light.backgroundPrimary,
          surfaceTintColor: ColorsUIThemes.instance.light.backgroundPrimary,
          scrolledUnderElevation: 8.0,
          foregroundColor: ColorsUIThemes.instance.light.textPrimary,
          shadowColor:
              ColorsUIThemes.instance.light.shadowAppBar.withOpacity(0.2),
        ),
        // colorScheme: ColorScheme.light(
        //   primary: ColorsUIThemes.instance.light.backgroundPrimary,
        //   onSecondary: ColorsUIThemes.instance.light.backgroundPrimary,
        // ),
        // textTheme: const TextTheme(),
        // textSelectionTheme: TextSelectionThemeData(
        //   cursorColor: ColorsUIThemes.instance.light.textGrey900,
        //   selectionColor: ColorsUIThemes.instance.light.backgroundLightBlue,
        //   selectionHandleColor: ColorsUIThemes.instance.light.backgroundBlue,
        // ),
      );

  static ThemeData darkTheme() => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorsUIThemes.instance.dark.backgroundPrimary,
        // dividerColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          titleTextStyle: TextStyle(
            fontFamily: "Jura",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsUIThemes.instance.dark.textPrimary,
          ),
          centerTitle: true,
          backgroundColor: ColorsUIThemes.instance.dark.backgroundPrimary,
          surfaceTintColor: ColorsUIThemes.instance.dark.backgroundPrimary,
          foregroundColor: ColorsUIThemes.instance.dark.textPrimary,
          scrolledUnderElevation: 8.0,
          shadowColor:
              ColorsUIThemes.instance.dark.shadowAppBar.withOpacity(0.2),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: ColorsUIThemes.instance.dark.darkBeruz,
        ),
        // colorScheme: ColorScheme.dark(
        //   primary: ColorsUIThemes.instance.dark.backgroundPrimary,
        //   onSecondary: ColorsUIThemes.instance.dark.backgroundPrimary,
        // ),
        // textSelectionTheme: TextSelectionThemeData(
        //   cursorColor: ColorsUIThemes.instance.dark.textGrey900,
        //   selectionColor: ColorsUIThemes.instance.dark.backgroundLightBlue,
        //   selectionHandleColor: ColorsUIThemes.instance.dark.backgroundBlue,
        // ),
      );

  static UIThemes of(BuildContext context) {
    return UIThemes(brightness: Theme.of(context).brightness);
  }

  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  bool get isDarkTheme => brightness == Brightness.dark;

  ///TextStyles
  ///
  ///Jura
  TextStyle get jura700x36 => const TextStyle(
        fontFamily: "Jura",
        fontSize: 36,
        fontWeight: FontWeight.w700,
      );

  TextStyle get jura700x32 => const TextStyle(
        fontFamily: "Jura",
        fontSize: 32,
        fontWeight: FontWeight.w700,
      );

  TextStyle get jura700x22 => const TextStyle(
        fontFamily: "Jura",
        fontSize: 22,
        fontWeight: FontWeight.w700,
      );

  TextStyle get jura700x20 => const TextStyle(
        fontFamily: "Jura",
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );

  TextStyle get jura700x16 => const TextStyle(
        fontFamily: "Jura",
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );

  TextStyle get jura700x15 => const TextStyle(
        fontFamily: "Jura",
        fontSize: 15,
        fontWeight: FontWeight.w700,
      );

  TextStyle get jura500x16 => const TextStyle(
        fontFamily: "Jura",
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  ///Montserrat

  TextStyle get montserrat500x20 => const TextStyle(
        fontFamily: "Montserrat",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.81,
        height: 30 / 16.0,
      );

  TextStyle get montserrat400x16 => const TextStyle(
        fontFamily: "Montserrat",
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.81,
        height: 30 / 16.0,
      );


// Automatically generated getters for colors
  // States colors

  Color get backgroundPrimary =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundPrimary : ColorsUIThemes.instance.light.backgroundPrimary;

  Color get backgroundAbsolutlyDark =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundAbsolutlyDark : ColorsUIThemes.instance.light.backgroundAbsolutlyDark;

  Color get darkBeruz =>
      isDarkTheme ? ColorsUIThemes.instance.dark.darkBeruz : ColorsUIThemes.instance.light.darkBeruz;

  Color get beruz =>
      isDarkTheme ? ColorsUIThemes.instance.dark.beruz : ColorsUIThemes.instance.light.beruz;

  Color get dustyRose =>
      isDarkTheme ? ColorsUIThemes.instance.dark.dustyRose : ColorsUIThemes.instance.light.dustyRose;

  Color get grey =>
      isDarkTheme ? ColorsUIThemes.instance.dark.grey : ColorsUIThemes.instance.light.grey;

  // borders, shadows

  Color get bordersPrimary =>
      isDarkTheme ? ColorsUIThemes.instance.dark.bordersPrimary : ColorsUIThemes.instance.light.bordersPrimary;

  Color get cursor =>
      isDarkTheme ? ColorsUIThemes.instance.dark.cursor : ColorsUIThemes.instance.light.cursor;

  Color get shadowAppBar =>
      isDarkTheme ? ColorsUIThemes.instance.dark.shadowAppBar : ColorsUIThemes.instance.light.shadowAppBar;

  // Text colors

  Color get textWhite =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textWhite : ColorsUIThemes.instance.light.textWhite;

  Color get textPrimary =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textPrimary : ColorsUIThemes.instance.light.textPrimary;
  // End of autogenerated getters
}
