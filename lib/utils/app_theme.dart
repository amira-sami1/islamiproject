import 'package:flutter/material.dart';
import 'package:islami_project/utils/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBlackColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor
      ),
    ),
  );
}
