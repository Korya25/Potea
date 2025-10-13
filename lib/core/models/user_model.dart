import 'package:potea_app/core/constants/database_keys.dart';

class UserModel {
  final String uid;
  final String? name;
  final String? email;
  final String? phone;
  final String? gender;
  final String? role;

  const UserModel({
    required this.uid,
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.role,
  });

  Map<String, dynamic> toMap() => {
    DatabaseKeys.uid: uid,
    DatabaseKeys.name: name,
    DatabaseKeys.email: email,
    DatabaseKeys.phone: phone,
    DatabaseKeys.gender: gender,
    DatabaseKeys.role: role,
  };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    uid: map[DatabaseKeys.uid],
    name: map[DatabaseKeys.name],
    email: map[DatabaseKeys.email],
    phone: map[DatabaseKeys.phone],
    gender: map[DatabaseKeys.gender],
    role: map[DatabaseKeys.role],
  );
}
