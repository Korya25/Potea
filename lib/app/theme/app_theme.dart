import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData darkTheme() {
    const String poppins = 'Poppins';

    return ThemeData(
      scaffoldBackgroundColor: AppColors.dBackPrimary,
      primaryColor: AppColors.primary,
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(color: AppColors.textAndIconWhite),

      textTheme: const TextTheme(
        // Display Styles
        displayLarge: TextStyle(
          fontFamily: poppins,
          fontSize: 57,
          fontWeight: FontWeight.w900, // Black
          color: AppColors.textAndIconBlack,
        ),
        displayMedium: TextStyle(
          fontFamily: poppins,
          fontSize: 45,
          fontWeight: FontWeight.w800, // ExtraBold
          color: AppColors.textAndIconPrimary,
        ),
        displaySmall: TextStyle(
          fontFamily: poppins,
          fontSize: 36,
          fontWeight: FontWeight.w700, // Bold
          color: AppColors.textAndIconWhite,
        ),

        // Headlines
        headlineLarge: TextStyle(
          fontFamily: poppins,
          fontSize: 32,
          fontWeight: FontWeight.w600, // SemiBold
          color: AppColors.textAndIconBlack,
        ),
        headlineMedium: TextStyle(
          fontFamily: poppins,
          fontSize: 28,
          fontWeight: FontWeight.w500, // Medium
          color: AppColors.textAndIconPrimary,
        ),
        headlineSmall: TextStyle(
          fontFamily: poppins,
          fontSize: 24,
          fontWeight: FontWeight.w700, // Bold
          color: AppColors.textAndIconGrey,
        ),

        // Titles
        titleLarge: TextStyle(
          fontFamily: poppins,
          fontSize: 22,
          fontWeight: FontWeight.w600, // SemiBold
          color: AppColors.textAndIconWhite,
        ),
        titleMedium: TextStyle(
          fontFamily: poppins,
          fontSize: 18,
          fontWeight: FontWeight.w500, // Medium
          color: AppColors.textAndIconBlack,
        ),
        titleSmall: TextStyle(
          fontFamily: poppins,
          fontSize: 16,
          fontWeight: FontWeight.w400, // Regular
          color: AppColors.textAndIconPrimary,
        ),

        // Body
        bodyLarge: TextStyle(
          fontFamily: poppins,
          fontSize: 16,
          fontWeight: FontWeight.w300, // Light
          color: AppColors.textAndIconWhite,
        ),
        bodyMedium: TextStyle(
          fontFamily: poppins,
          fontSize: 14,
          fontWeight: FontWeight.w400, // Regular
          color: AppColors.textAndIconGrey,
        ),
        bodySmall: TextStyle(
          fontFamily: poppins,
          fontSize: 12,
          fontWeight: FontWeight.w200, // ExtraLight
          color: AppColors.textAndIconBlack,
        ),

        // Labels
        labelLarge: TextStyle(
          fontFamily: poppins,
          fontSize: 14,
          fontWeight: FontWeight.w600, // SemiBold
          color: AppColors.textAndIconPrimary,
        ),
        labelMedium: TextStyle(
          fontFamily: poppins,
          fontSize: 12,
          fontWeight: FontWeight.w500, // Medium
          color: AppColors.textAndIconWhite,
        ),
        labelSmall: TextStyle(
          fontFamily: poppins,
          fontSize: 10,
          fontWeight: FontWeight.w100, // Thin
          color: AppColors.textAndIconGrey,
        ),
      ),

      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.dBackPrimary,
        iconTheme: IconThemeData(color: AppColors.textAndIconWhite),
        titleTextStyle: TextStyle(
          fontFamily: poppins,
          fontSize: 16,
          fontWeight: FontWeight.w500, // Medium
          color: AppColors.textAndIconWhite,
        ),
      ),
    );
  }
}
