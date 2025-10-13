import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:potea_app/core/models/user_model.dart';
import 'package:potea_app/core/constants/firestore_keys.dart';

/// Remote Data Source
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

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user;
    if (user == null) {
      throw FirebaseAuthException(code: 'USER_NULL', message: 'No user found');
    }

    final doc = await firestore
        .collection(FirestoreKeys.users)
        .doc(user.uid)
        .get();
    if (doc.exists && doc.data() != null) {
      final data = doc.data()!;
      return UserModel(
        uid: data[FirestoreKeys.uid],
        email: data[FirestoreKeys.email],
        name: data[FirestoreKeys.name],
      );
    } else {
      return UserModel(uid: user.uid, email: email, name: user.displayName);
    }
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

    final user = userCredential.user;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'USER_NULL',
        message: 'User creation failed',
      );
    }

    await user.updateDisplayName(name);

    final userModel = UserModel(uid: user.uid, email: email, name: name);

    await firestore.collection(FirestoreKeys.users).doc(user.uid).set({
      FirestoreKeys.uid: user.uid,
      FirestoreKeys.email: email,
      FirestoreKeys.name: name,
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
