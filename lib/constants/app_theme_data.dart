import 'package:flutter/material.dart';
import 'package:monkey_ao/constants/app_colors.dart';

class AppThemeData {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: AppColors.titleColor,
      elevation: 1,
    ),
    scaffoldBackgroundColor: const Color(0xFFECDFCC),
  );
}
