import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CTextTheme {
  CTextTheme._();

  static TextTheme lightTextTheme = const TextTheme().copyWith(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 50.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 40.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 35.sp,
      color: Colors.black,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 30.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 28.sp,
      color: Colors.black,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 26.sp,
      color: Colors.black,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
  static TextTheme darkTextTheme = const TextTheme().copyWith(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 50.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 40.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 35.sp,
      color: Colors.white,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 30.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 28.sp,
      color: Colors.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 26.sp,
      color: Colors.white,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}
