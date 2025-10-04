import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  // Dark Theme
  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.darkBackgroundPrimary,
      primaryColor: AppColors.primary,
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(color: AppColors.textAndIconWhite),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.lexend(
          color: AppColors.textAndIconWhite,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.lexend(
          color: AppColors.textAndIconGrey,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.25,
          height: 1.4,
        ),
        bodySmall: GoogleFonts.lexend(
          color: AppColors.textAndIconBlack,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.2,
          height: 1.3,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackgroundSecondary,
        iconTheme: const IconThemeData(color: AppColors.textAndIconWhite),
        titleTextStyle: GoogleFonts.lexend(
          color: AppColors.textAndIconWhite,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
