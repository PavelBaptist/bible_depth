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
        dividerColor: Colors.transparent,
        dialogTheme: DialogTheme(
          elevation: 0,
          backgroundColor: ColorsUIThemes.instance.light.backgroundPrimary,
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          centerTitle: true,
          backgroundColor: ColorsUIThemes.instance.light.backgroundPrimary,
          elevation: 0,
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.1),
        ),
        colorScheme: ColorScheme.light(
          primary: ColorsUIThemes.instance.light.backgroundPrimary,
          onSecondary: ColorsUIThemes.instance.light.backgroundPrimary,
        ),
        textTheme: const TextTheme(),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorsUIThemes.instance.light.textGrey900,
          selectionColor: ColorsUIThemes.instance.light.backgroundLightBlue,
          selectionHandleColor: ColorsUIThemes.instance.light.backgroundBlue,
        ),
      );

  static ThemeData darkTheme() => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorsUIThemes.instance.dark.backgroundPrimary,
        dividerColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          centerTitle: true,
          backgroundColor: ColorsUIThemes.instance.dark.backgroundPrimary,
          elevation: 0,
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.1),
        ),
        colorScheme: ColorScheme.dark(
          primary: ColorsUIThemes.instance.dark.backgroundPrimary,
          onSecondary: ColorsUIThemes.instance.dark.backgroundPrimary,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorsUIThemes.instance.dark.textGrey900,
          selectionColor: ColorsUIThemes.instance.dark.backgroundLightBlue,
          selectionHandleColor: ColorsUIThemes.instance.dark.backgroundBlue,
        ),
      );

  static UIThemes of(BuildContext context) {
    return UIThemes(brightness: Theme.of(context).brightness);
  }

  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  bool get isDarkTheme => brightness == Brightness.dark;

  TextStyle get subheading16bold => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  TextStyle get bodyM3medium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  TextStyle get body12SmallLH16LS04 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        letterSpacing: 0.4,
      );

  TextStyle get body14RegularLH20LS025 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        letterSpacing: 0.25,
      );

  TextStyle get body9RegularLH20LS025 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 9,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        letterSpacing: 0.25,
      );

  TextStyle get body14Medium700LH20LS025 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 20 / 14,
        letterSpacing: 0.25,
      );

  TextStyle get body14Medium600LH20LS025 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        letterSpacing: 0.25,
      );

  TextStyle get body16RegularLH24LS05 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        letterSpacing: 0.5,
      );

  TextStyle get body16MediumLH20LS01 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 20 / 16,
        letterSpacing: 0.1,
      );

  TextStyle get labelM3medium => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );

  TextStyle get label16SmallLH24LS075 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 16.5,
        fontWeight: FontWeight.w500,
        height: 24 / 16.5,
        letterSpacing: 0.75,
      );

  TextStyle get label11MediumLH16LS05 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 16 / 11,
        letterSpacing: 0.5,
      );

  TextStyle get label12MediumLH12LS05 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        letterSpacing: 0.5,
      );

  TextStyle get label14MediumLH20LS01 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  TextStyle get title40BoldLH48 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 40,
        fontWeight: FontWeight.w600,
        height: 48 / 40,
      );

  TextStyle get title22M3LargeLH28 => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 28 / 22,
      );

  TextStyle get title22SemiboldLH28 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 28 / 22,
      );

  TextStyle get title16M3MediumLH24LS015 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: 0.15,
      );

  TextStyle get title14M3MediumLH20LS01 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  TextStyle get titleMedium => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  TextStyle get display40LargeLH48 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 40,
        fontWeight: FontWeight.w900,
        height: 48 / 40,
      );

  TextStyle get display32MediumLH38 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 32,
        fontWeight: FontWeight.w500,
        height: 38.4 / 40,
      );

  TextStyle get headline24SmallLH32 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  TextStyle get headline20SmallLH32 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  TextStyle get titleMedium18LH24LS015 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: 0.15,
      );

  TextStyle get dialog20BoldLH32 => const TextStyle(
        fontFamily: "Roboto",
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 32 / 20,
        letterSpacing: 0,
      );


// Automatically generated getters for colors
  // States colors

  Color get statesGreen600 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.statesGreen600 : ColorsUIThemes.instance.light.statesGreen600;

  Color get statesAmber500 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.statesAmber500 : ColorsUIThemes.instance.light.statesAmber500;

  Color get statesRed700 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.statesRed700 : ColorsUIThemes.instance.light.statesRed700;

  // Accent colors

  Color get accentGreen600 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.accentGreen600 : ColorsUIThemes.instance.light.accentGreen600;

  Color get accentRed100 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.accentRed100 : ColorsUIThemes.instance.light.accentRed100;

  Color get accentAmber500 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.accentAmber500 : ColorsUIThemes.instance.light.accentAmber500;

  Color get accentOrange100 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.accentOrange100 : ColorsUIThemes.instance.light.accentOrange100;

  Color get accentRed700 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.accentRed700 : ColorsUIThemes.instance.light.accentRed700;

  Color get accentGrey300 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.accentGrey300 : ColorsUIThemes.instance.light.accentGrey300;

  // Dividers,borders colors

  Color get borderViolet200 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.borderViolet200 : ColorsUIThemes.instance.light.borderViolet200;

  Color get borderGray400 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.borderGray400 : ColorsUIThemes.instance.light.borderGray400;

  Color get borderGray500 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.borderGray500 : ColorsUIThemes.instance.light.borderGray500;

  Color get borderGreen700 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.borderGreen700 : ColorsUIThemes.instance.light.borderGreen700;

  Color get borderGreen600 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.borderGreen600 : ColorsUIThemes.instance.light.borderGreen600;

  Color get borderPrimary =>
      isDarkTheme ? ColorsUIThemes.instance.dark.borderPrimary : ColorsUIThemes.instance.light.borderPrimary;

  Color get bottomSheetHandle =>
      isDarkTheme ? ColorsUIThemes.instance.dark.bottomSheetHandle : ColorsUIThemes.instance.light.bottomSheetHandle;

  Color get dividerGray200 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.dividerGray200 : ColorsUIThemes.instance.light.dividerGray200;

  // Background colors

  Color get backgroundPrimary =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundPrimary : ColorsUIThemes.instance.light.backgroundPrimary;

  Color get backgroundViolet50 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundViolet50 : ColorsUIThemes.instance.light.backgroundViolet50;

  Color get backgroundViolet100 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundViolet100 : ColorsUIThemes.instance.light.backgroundViolet100;

  Color get backgroundViolet200 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundViolet200 : ColorsUIThemes.instance.light.backgroundViolet200;

  Color get backgroundViolet400 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundViolet400 : ColorsUIThemes.instance.light.backgroundViolet400;

  Color get backgroundViolet600 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundViolet600 : ColorsUIThemes.instance.light.backgroundViolet600;

  Color get backgroundViolet800 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundViolet800 : ColorsUIThemes.instance.light.backgroundViolet800;

  Color get backgroundCoolGray50 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundCoolGray50 : ColorsUIThemes.instance.light.backgroundCoolGray50;

  Color get backgroundCoolGray100 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundCoolGray100 : ColorsUIThemes.instance.light.backgroundCoolGray100;

  Color get backgroundCoolGray200 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundCoolGray200 : ColorsUIThemes.instance.light.backgroundCoolGray200;

  Color get backgroundCoolGray300 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundCoolGray300 : ColorsUIThemes.instance.light.backgroundCoolGray300;

  Color get backgroundRed50 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundRed50 : ColorsUIThemes.instance.light.backgroundRed50;

  Color get backgroundRed100 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundRed100 : ColorsUIThemes.instance.light.backgroundRed100;

  Color get backgroundRed200 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundRed200 : ColorsUIThemes.instance.light.backgroundRed200;

  Color get backgroundRed400 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundRed400 : ColorsUIThemes.instance.light.backgroundRed400;

  Color get backgroundRed500 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundRed500 : ColorsUIThemes.instance.light.backgroundRed500;

  Color get backgroundOrange50 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundOrange50 : ColorsUIThemes.instance.light.backgroundOrange50;

  Color get backgroundOrange100 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundOrange100 : ColorsUIThemes.instance.light.backgroundOrange100;

  Color get backgroundOrange200 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundOrange200 : ColorsUIThemes.instance.light.backgroundOrange200;

  Color get backgroundOrange300 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundOrange300 : ColorsUIThemes.instance.light.backgroundOrange300;

  Color get backgroundBlue =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundBlue : ColorsUIThemes.instance.light.backgroundBlue;

  Color get backgroundBlue300 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundBlue300 : ColorsUIThemes.instance.light.backgroundBlue300;

  Color get backgroundButtonDisable =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundButtonDisable : ColorsUIThemes.instance.light.backgroundButtonDisable;

  Color get backgroundButtonSecondary =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundButtonSecondary : ColorsUIThemes.instance.light.backgroundButtonSecondary;

  Color get backgroundButtonPrimary =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundButtonPrimary : ColorsUIThemes.instance.light.backgroundButtonPrimary;

  Color get backgroundAuthAppBar =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundAuthAppBar : ColorsUIThemes.instance.light.backgroundAuthAppBar;

  Color get backgroundLightBlue =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundLightBlue : ColorsUIThemes.instance.light.backgroundLightBlue;

  Color get backgroundCardJob =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundCardJob : ColorsUIThemes.instance.light.backgroundCardJob;

  Color get backgroundButtonLoading =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundButtonLoading : ColorsUIThemes.instance.light.backgroundButtonLoading;

  Color get backgroundIconBlue =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundIconBlue : ColorsUIThemes.instance.light.backgroundIconBlue;

  Color get backgroundSnackBar =>
      isDarkTheme ? ColorsUIThemes.instance.dark.backgroundSnackBar : ColorsUIThemes.instance.light.backgroundSnackBar;

  // Text colors

  Color get textGrey900 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textGrey900 : ColorsUIThemes.instance.light.textGrey900;

  Color get textGrey700 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textGrey700 : ColorsUIThemes.instance.light.textGrey700;

  Color get textGrey600 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textGrey600 : ColorsUIThemes.instance.light.textGrey600;

  Color get textGrey500 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textGrey500 : ColorsUIThemes.instance.light.textGrey500;

  Color get textGrey400 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textGrey400 : ColorsUIThemes.instance.light.textGrey400;

  Color get textLightGrey =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textLightGrey : ColorsUIThemes.instance.light.textLightGrey;

  Color get textWhite =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textWhite : ColorsUIThemes.instance.light.textWhite;

  Color get textViolet800 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textViolet800 : ColorsUIThemes.instance.light.textViolet800;

  Color get textGreen800 =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textGreen800 : ColorsUIThemes.instance.light.textGreen800;

  Color get textPrimary =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textPrimary : ColorsUIThemes.instance.light.textPrimary;

  Color get textActiveTab =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textActiveTab : ColorsUIThemes.instance.light.textActiveTab;

  Color get textNoactiveTab =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textNoactiveTab : ColorsUIThemes.instance.light.textNoactiveTab;

  Color get textRed =>
      isDarkTheme ? ColorsUIThemes.instance.dark.textRed : ColorsUIThemes.instance.light.textRed;

  // ShadowColors

  Color get shadowAppBar =>
      isDarkTheme ? ColorsUIThemes.instance.dark.shadowAppBar : ColorsUIThemes.instance.light.shadowAppBar;
  // End of autogenerated getters
}
