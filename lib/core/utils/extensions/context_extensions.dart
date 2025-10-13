import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  /// MediaQuery
  MediaQueryData get mq => MediaQuery.of(this);

  double get screenWidth => mq.size.width;
  double get screenHeight => mq.size.height;
}

extension StringLimitExtension on String {
  String limit(int maxChars) {
    if (length <= maxChars) return this;
    return substring(0, maxChars);
  }

  String get firstName {
    if (trim().isEmpty) return '';
    return trim().split(' ').first;
  }

  String get firstAndSecondName {
    final parts = trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts.first;
    return '${parts[0]} ${parts[1]}';
  }
}
