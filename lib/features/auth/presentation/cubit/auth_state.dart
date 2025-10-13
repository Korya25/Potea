import 'package:potea_app/core/models/user_model.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserModel user;
  const AuthAuthenticated({required this.user});
}

class AuthUnauthenticated extends AuthState {}

class AuthPasswordResetEmailSent extends AuthState {}

class AuthError extends AuthState {
  final String message;
  const AuthError({required this.message});
}
