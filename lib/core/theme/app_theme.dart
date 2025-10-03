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
      iconTheme: const IconThemeData(color: AppColors.darkTextAndIconPrimary),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
          color: AppColors.darkTextAndIconPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: AppColors.darkTextAndIconSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.25,
          height: 1.4,
        ),
        bodySmall: GoogleFonts.poppins(
          color: AppColors.darkTextAndIconThritly,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.2,
          height: 1.3,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackgroundSecondary,
        iconTheme: const IconThemeData(color: AppColors.darkTextAndIconPrimary),
        titleTextStyle: GoogleFonts.poppins(
          color: AppColors.darkTextAndIconPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Light Theme
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.lightBackgroundPrimary,
      primaryColor: AppColors.primary,
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: AppColors.lightTextAndIconPrimary),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
          color: AppColors.lightTextAndIconPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: AppColors.lightTextAndIconSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.25,
          height: 1.4,
        ),
        bodySmall: GoogleFonts.poppins(
          color: AppColors.lightTextAndIconThritly,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.2,
          height: 1.3,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightBackgroundSecondary,
        iconTheme: const IconThemeData(
          color: AppColors.lightTextAndIconPrimary,
        ),
        titleTextStyle: GoogleFonts.poppins(
          color: AppColors.lightTextAndIconPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
