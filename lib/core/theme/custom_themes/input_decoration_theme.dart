import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/core/constants/app_colors.dart';

class CInputDecorationTheme {
  CInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme().copyWith(
    focusColor: AppColorsLight.blackColor,
    hintStyle: TextStyle(
      color: AppColorsLight.searchHintColor,
      fontSize: 28.spMin,
    ),
    suffixIconColor: AppColorsLight.searchHintColor,
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme().copyWith(
    focusColor: AppColorsDark.blackColor,
    hintStyle: TextStyle(
      color: AppColorsDark.searchHintColor,
      fontSize: 28.spMin,
    ),
    suffixIconColor: AppColorsDark.searchHintColor,
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
  );
}
