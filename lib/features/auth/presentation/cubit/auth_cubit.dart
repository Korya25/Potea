import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potea_app/core/errors/failure.dart';
import 'package:potea_app/features/auth/data/repo/auth_repo.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit({required this.repository}) : super(AuthInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await repository.signInWithEmail(
        email: email,
        password: password,
      );
      emit(AuthAuthenticated(user: user));
    } on AuthFailure catch (e) {
      emit(AuthError(message: e.message));
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    try {
      final user = await repository.signUpWithEmail(
        email: email,
        password: password,
        name: name,
      );
      emit(AuthAuthenticated(user: user));
    } on AuthFailure catch (e) {
      emit(AuthError(message: e.message));
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    emit(AuthLoading());
    try {
      await repository.sendPasswordResetEmail(email: email);
      emit(AuthPasswordResetEmailSent());
    } on AuthFailure catch (e) {
      emit(AuthError(message: e.message));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await repository.signOut();
      emit(AuthUnauthenticated());
    } on AuthFailure catch (e) {
      emit(AuthError(message: e.message));
    }
  }
}
