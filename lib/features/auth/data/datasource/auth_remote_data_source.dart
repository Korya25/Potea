import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:potea_app/core/models/user_model.dart';
import 'package:potea_app/core/constants/firestore_keys.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<void> sendPasswordResetEmail({required String email});

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  /// Helper method to build a UserModel from Firebase user + Firestore document.
  Future<UserModel> _buildUserModel(User? firebaseUser) async {
    if (firebaseUser == null) {
      throw FirebaseAuthException(
        code: 'USER_NULL',
        message: 'Firebase user is null',
      );
    }

    final uid = firebaseUser.uid;
    final email = firebaseUser.email;
    if (email == null || email.isEmpty) {
      throw FirebaseAuthException(
        code: 'EMAIL_NULL',
        message: 'Firebase user email is null',
      );
    }

    final doc = await firestore.collection('users').doc(uid).get();

    if (doc.exists) {
      final data = doc.data()!;
      return UserModel(
        uid: data[FirestoreKeys.uid],
        email: data[FirestoreKeys.email],
        name: data[FirestoreKeys.name],
        phone: data[FirestoreKeys.phone],
        gender: data[FirestoreKeys.gender],
      );
    } else {
      // fallback if user document doesn't exist
      return UserModel(uid: uid, email: email, name: firebaseUser.displayName);
    }
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return _buildUserModel(userCredential.user);
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final firebaseUser = userCredential.user;
    if (firebaseUser == null) {
      throw FirebaseAuthException(
        code: 'USER_NULL',
        message: 'Firebase user is null',
      );
    }

    // Update FirebaseAuth displayName too
    await firebaseUser.updateDisplayName(name);

    // Create user model
    final userModel = UserModel(
      uid: firebaseUser.uid,
      email: email,
      name: name,
    );

    // Store user in Firestore with clear keys
    await firestore.collection('users').doc(firebaseUser.uid).set({
      FirestoreKeys.uid: firebaseUser.uid,
      FirestoreKeys.email: email,
      FirestoreKeys.name: name,
      FirestoreKeys.phone: null,
      FirestoreKeys.gender: null,
    });

    return userModel;
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
