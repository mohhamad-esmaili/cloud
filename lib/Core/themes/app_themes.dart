import 'package:cloud/Core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();
  static final lightTheme = ThemeData(
    fontFamily: 'Glory',
    scaffoldBackgroundColor: AppColors.scaffoldLightBackgroundColor,
    listTileTheme: ListTileThemeData(
      tileColor: AppColors.listTilelightBackgroundColor,
      titleTextStyle: const TextStyle(color: AppColors.darkTextColor),
      subtitleTextStyle: const TextStyle(color: AppColors.darkTextColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.darkTextColor),
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: 'Glory',
    scaffoldBackgroundColor: AppColors.scaffoldDarkBackgroundColor,
    listTileTheme: ListTileThemeData(
      tileColor: const Color(0xff4E5257),
      titleTextStyle: const TextStyle(color: AppColors.lightTextColor),
      subtitleTextStyle: const TextStyle(color: AppColors.lightTextColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
