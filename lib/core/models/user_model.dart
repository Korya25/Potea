import 'package:potea_app/core/constants/firestore_keys.dart';

class UserModel {
  final String uid;
  final String? name;
  final String? email;
  final String? phone;
  final String? gender;

  const UserModel({
    required this.uid,
    this.name,
    this.email,
    this.phone,
    this.gender,
  });

  Map<String, dynamic> toMap() => {
    FirestoreKeys.uid: uid,
    FirestoreKeys.name: name,
    FirestoreKeys.email: email,
    FirestoreKeys.phone: phone,
    FirestoreKeys.gender: gender,
  };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    uid: map[FirestoreKeys.uid],
    name: map[FirestoreKeys.name],
    email: map[FirestoreKeys.email],
    phone: map[FirestoreKeys.phone],
    gender: map[FirestoreKeys.gender],
  );
}
