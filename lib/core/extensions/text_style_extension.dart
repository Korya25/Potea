import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  // Display Styles
  TextStyle get font57BlackW900 => textTheme.displayLarge!;
  TextStyle get font45PrimaryW800 => textTheme.displayMedium!;
  TextStyle get font36WhiteW700 => textTheme.displaySmall!;

  // Headline Styles
  TextStyle get font32BlackW600 => textTheme.headlineLarge!;
  TextStyle get font28PrimaryW500 => textTheme.headlineMedium!;
  TextStyle get font24GreyW700 => textTheme.headlineSmall!;

  // Title Styles
  TextStyle get font22WhiteW600 => textTheme.titleLarge!;
  TextStyle get font18BlackW500 => textTheme.titleMedium!;
  TextStyle get font16PrimaryW400 => textTheme.titleSmall!;

  // Body Styles
  TextStyle get font16WhiteW300 => textTheme.bodyLarge!;
  TextStyle get font14GreyW400 => textTheme.bodyMedium!;
  TextStyle get font12BlackW200 => textTheme.bodySmall!;

  // Label Styles
  TextStyle get font14PrimaryW600 => textTheme.labelLarge!;
  TextStyle get font12WhiteW500 => textTheme.labelMedium!;
  TextStyle get font10GreyW100 => textTheme.labelSmall!;
}
