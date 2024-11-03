import 'package:flutter/material.dart';
import 'package:monkey_ao/constants/app_colors.dart';

class AppThemeData {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarBackgroundColor,
      foregroundColor: AppColors.titleColor,
      elevation: 1,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    colorScheme: ColorScheme.light(
      primary: AppColors.titleColor,
      primaryContainer: AppColors.textColor,
      surface: AppColors.scaffoldBackgroundColor,
      surfaceContainer: AppColors.appBarBackgroundColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.dartAppBarBackgroundColor,
      foregroundColor: AppColors.dartTitleColor,
      elevation: 1,
    ),
    scaffoldBackgroundColor: const Color(0xFF2C2C2C),
    colorScheme: ColorScheme.dark(
      primary: AppColors.dartTitleColor,
      primaryContainer: AppColors.dartTextColor,
      surface: AppColors.dartScaffoldBackgroundColor,
      surfaceContainer: AppColors.dartAppBarBackgroundColor,
    ),
  );
}
