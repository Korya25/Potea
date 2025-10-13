class AuthFailure implements Exception {
  final String message;
  final String? code;

  AuthFailure({required this.message, this.code});

  @override
  String toString() => 'AuthFailure(code: $code, message: $message)';
}
