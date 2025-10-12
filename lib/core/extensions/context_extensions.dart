import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  /// MediaQuery
  MediaQueryData get mq => MediaQuery.of(this);

  double get screenWidth => mq.size.width;
  double get screenHeight => mq.size.height;
}
