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
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF3A3A3A),
      foregroundColor: Color(0xFFDADADA),
      elevation: 1,
    ),
    scaffoldBackgroundColor: const Color(0xFF2C2C2C),
  );
}
