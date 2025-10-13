// lib/core/utils/validators.dart
class Validators {
  // Validate Email
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    // Simple email regex
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email';
    }

    return null;
  }

  // Validate Password
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  // Validate Name (two words, each at least 3 letters, English only)
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    final parts = value.trim().split(' ');

    if (parts.length < 2) {
      return 'Please enter at least two names';
    }

    final nameRegex = RegExp(r'^[A-Za-z]{3,}$');

    for (var part in parts) {
      if (!nameRegex.hasMatch(part)) {
        return 'Each name must be at least 3 letters and only English';
      }
    }

    return null;
  }
}
