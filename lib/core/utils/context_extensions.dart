import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// Theme & Text
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodySmall => textTheme.bodySmall!;

  /// Colors
  Color get primaryColor => theme.primaryColor;
  Color get scaffoldBackground => theme.scaffoldBackgroundColor;
  Color get iconColor => theme.iconTheme.color ?? Colors.black;

  /// MediaQuery
  MediaQueryData get mq => MediaQuery.of(this);

  double get screenWidth => mq.size.width;
  double get screenHeight => mq.size.height;
}
