import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/core/constants/app_colors.dart';

class CElevatedButtonTheme {
  CElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorsLight.bgSecondaryColor,
      foregroundColor: AppColorsLight.bgColor,
      fixedSize: Size(450.w, 80.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50).r,
      ),
    ),
  );
  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorsDark.bgSecondaryColor,
      foregroundColor: AppColorsDark.bgColor,
      fixedSize: Size(450.w, 80.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50).r,
      ),
    ),
  );
}
