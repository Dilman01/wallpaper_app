import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/constants/app_colors.dart';
import 'package:wallpaper_app/core/theme/custom_themes/appbar_theme.dart';
import 'package:wallpaper_app/core/theme/custom_themes/elevated_button_theme.dart';
import 'package:wallpaper_app/core/theme/custom_themes/input_decoration_theme.dart';
import 'package:wallpaper_app/core/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColorsLight.bgColor,
      brightness: Brightness.light,
      onPrimaryContainer: AppColorsLight.bgSecondaryColor,
      surface: AppColorsLight.tabBarBgColor,
      primary: AppColorsLight.gradentFirstColor,
      onPrimary: AppColorsLight.gradientSecondColor,
      onSecondary: AppColorsLight.whiteColor,
      onTertiary: AppColorsLight.blackColor,
      onSecondaryContainer: AppColorsLight.searchBgColor,
      onTertiaryContainer: AppColorsLight.searchHintColor,
      outline: AppColorsLight.settingColor,
      onPrimaryFixed: AppColorsLight.highlightColor,
      onSecondaryFixed: AppColorsLight.baseColor,
    ),
    scaffoldBackgroundColor: AppColorsLight.bgColor,
    appBarTheme: CAppBarTheme.lightAppBarTheme,
    primaryColor: AppColorsLight.bgColor,
    highlightColor: AppColorsLight.highlightColor,
    inputDecorationTheme: CInputDecorationTheme.lightInputDecorationTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    textTheme: CTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColorsDark.bgColor,
      brightness: Brightness.dark,
      onPrimaryContainer: AppColorsDark.bgSecondaryColor,
      surface: AppColorsDark.tabBarBgColor,
      primary: AppColorsDark.gradentFirstColor,
      onPrimary: AppColorsDark.gradientSecondColor,
      onSecondary: AppColorsDark.bgColor,
      onTertiary: AppColorsDark.whiteColor,
      onSecondaryContainer: AppColorsDark.searchBgColor,
      onTertiaryContainer: AppColorsDark.searchHintColor,
      outline: AppColorsDark.whiteColor,
      onPrimaryFixed: AppColorsDark.highlightColor,
      onSecondaryFixed: AppColorsDark.baseColor,
    ),
    scaffoldBackgroundColor: AppColorsDark.bgColor,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
    primaryColor: AppColorsDark.bgColor,
    highlightColor: AppColorsDark.highlightColor,
    inputDecorationTheme: CInputDecorationTheme.darkInputDecorationTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    textTheme: CTextTheme.darkTextTheme,
  );
}
