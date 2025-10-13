import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:potea_app/core/constants/error_messages.dart';
import 'package:potea_app/core/errors/failure.dart';
import 'package:potea_app/core/models/user_model.dart';
import 'package:potea_app/core/services/network/network_services.dart';
import 'package:potea_app/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:potea_app/features/auth/data/datasource/auth_remote_data_source.dart';

/// Repository interface
abstract class AuthRepository {
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  });

  Future<void> sendPasswordResetEmail({required String email});
  Future<void> signOut();
  Future<UserModel> refreshUserData();
}

/// Repository implementation
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkService networkService;
  final FirebaseAuth firebaseAuth;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkService,
    required this.firebaseAuth,
  });

  Future<void> _checkConnection() async {
    if (kIsWeb) return;
    final isConnected = await networkService.isConnected();
    if (!isConnected) {
      throw AuthFailure(ErrorMessages.noInternet, code: 'NO_INTERNET');
    }
  }

  @override
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await _checkConnection();
    try {
      final user = await remoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await localDataSource.cacheUser(user);
      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(e.message ?? ErrorMessages.firebaseError, code: e.code);
    } catch (e) {
      throw AuthFailure('${ErrorMessages.unexpectedError}: $e');
    }
  }

  @override
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    await _checkConnection();
    try {
      final user = await remoteDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      await localDataSource.cacheUser(user);
      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(e.message ?? ErrorMessages.firebaseError, code: e.code);
    } catch (e) {
      throw AuthFailure('${ErrorMessages.unexpectedError}: $e');
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await _checkConnection();
    try {
      await remoteDataSource.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(e.message ?? ErrorMessages.firebaseError, code: e.code);
    } catch (e) {
      throw AuthFailure('${ErrorMessages.unexpectedError}: $e');
    }
  }

  @override
  Future<UserModel> refreshUserData() async {
    try {
      final currentUser = firebaseAuth.currentUser;
      if (currentUser == null) {
        throw AuthFailure(ErrorMessages.userNull, code: 'NO_USER');
      }

      final uid = currentUser.uid;

      try {
        await _checkConnection();

        final latestUser = await remoteDataSource.getUserByUid(uid);
        await localDataSource.cacheUser(latestUser);

        return latestUser;
      } catch (_) {
        final cachedUser = await localDataSource.getCachedUser(uid);
        if (cachedUser != null) {
          return cachedUser;
        } else {
          throw AuthFailure(ErrorMessages.noInternetAndNoCache);
        }
      }
    } catch (e) {
      throw AuthFailure('${ErrorMessages.unexpectedError}: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await _checkConnection();
    try {
      final uid = firebaseAuth.currentUser?.uid;
      if (uid != null) {
        await localDataSource.clearUser(uid);
      }
      await remoteDataSource.signOut();
    } catch (e) {
      throw AuthFailure('${ErrorMessages.signOutFailed}: $e');
    }
  }
}
