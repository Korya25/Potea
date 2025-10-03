import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  /// Shortcuts for text styles
  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodySmall => textTheme.bodySmall!;

  /// Easy access to colors from theme
  Color get primaryColor => theme.primaryColor;
  Color get scaffoldBackground => theme.scaffoldBackgroundColor;
  Color get iconColor => theme.iconTheme.color ?? Colors.black;
}
