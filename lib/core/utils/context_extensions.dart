import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// Theme & Text
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  TextStyle get font16WhiteW300 => textTheme.bodyLarge!;
  TextStyle get font16GreyW50 => textTheme.bodyMedium!;
  TextStyle get font14BlackW400 => textTheme.bodySmall!;

  /// Colors
  Color get primaryColor => theme.primaryColor;
  Color get scaffoldBackground => theme.scaffoldBackgroundColor;
  Color get iconColor => theme.iconTheme.color ?? Colors.black;

  /// MediaQuery
  MediaQueryData get mq => MediaQuery.of(this);

  double get screenWidth => mq.size.width;
  double get screenHeight => mq.size.height;
}
