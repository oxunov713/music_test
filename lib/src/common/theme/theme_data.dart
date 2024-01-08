import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../tools/fonts.dart';

class MyAppThemeData {
  ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    cardColor: AppColors.dark,
    primaryColor: AppColors.orange,
    primaryIconTheme: IconThemeData(color: AppColors.blue),
    indicatorColor: AppColors.white30,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.white30),
    iconTheme: IconThemeData(
      color: AppColors.grey800,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blueTextStory,
      unselectedItemColor: AppColors.grey800,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: FontFamily.Exo2.fFamily,
        color: AppColors.white,
        overflow: TextOverflow.ellipsis,
      ),
      headlineSmall: TextStyle(
        fontFamily: FontFamily.SpaceGrotesk.fFamily,
        color: AppColors.dark,
        overflow: TextOverflow.ellipsis,
      ),
      headlineMedium: TextStyle(
        fontFamily: FontFamily.Jost.fFamily,
        color: AppColors.dark,
        overflow: TextOverflow.ellipsis,
      ),
      headlineLarge: TextStyle(
        color: AppColors.grey800,
        fontFamily: FontFamily.EBGaramond.fFamily,
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
        overflow: TextOverflow.visible,
      ),
      titleLarge: TextStyle(
        fontFamily: FontFamily.JosefinSans.fFamily,
        color: AppColors.blueTextStory,
        overflow: TextOverflow.ellipsis,
      ),
      titleSmall: TextStyle(
        fontFamily: FontFamily.JosefinSans.fFamily,
        color: AppColors.dark80,
        overflow: TextOverflow.ellipsis,
      ),
      titleMedium: TextStyle(
        fontFamily: FontFamily.JosefinSans.fFamily,
        color: AppColors.blueTextStory,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );

  ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    cardColor: AppColors.white,
    primaryColor: AppColors.white30,
    primaryIconTheme: IconThemeData(color: AppColors.blue),
    indicatorColor: AppColors.white80,
    scaffoldBackgroundColor: AppColors.dark,
    iconTheme: IconThemeData(
      color: AppColors.white80,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blueTextStory,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: FontFamily.Exo2.fFamily,
        color: AppColors.white,
        overflow: TextOverflow.ellipsis,
      ),
      headlineMedium: TextStyle(
        fontFamily: FontFamily.Jost.fFamily,
        color: AppColors.white,
        overflow: TextOverflow.ellipsis,
      ),
      headlineSmall: TextStyle(
        fontFamily: FontFamily.SpaceGrotesk.fFamily,
        color: AppColors.white,
        overflow: TextOverflow.ellipsis,
      ),
      headlineLarge: TextStyle(
          color: AppColors.white,
          fontFamily: FontFamily.EBGaramond.fFamily,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
          overflow: TextOverflow.visible),
      titleLarge: TextStyle(
        fontFamily: FontFamily.JosefinSans.fFamily,
        color: AppColors.blueTextStory,
        overflow: TextOverflow.ellipsis,
      ),
      titleSmall: TextStyle(
        fontFamily: FontFamily.JosefinSans.fFamily,
        color: AppColors.white80,
        overflow: TextOverflow.ellipsis,
      ),
      titleMedium: TextStyle(
        fontFamily: FontFamily.JosefinSans.fFamily,
        color: AppColors.blueTextStory,
      ),
    ),
  );
}
