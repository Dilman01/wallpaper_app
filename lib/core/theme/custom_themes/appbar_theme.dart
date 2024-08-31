import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper_app/core/constants/app_colors.dart';

class CAppBarTheme {
  CAppBarTheme._();

  static AppBarTheme lightAppBarTheme = const AppBarTheme().copyWith(
    backgroundColor: AppColorsLight.bgColor,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
  static AppBarTheme darkAppBarTheme = const AppBarTheme().copyWith(
    backgroundColor: AppColorsDark.bgColor,
    elevation: 0,
    scrolledUnderElevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  );
}
