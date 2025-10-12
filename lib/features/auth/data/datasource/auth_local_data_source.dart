import 'dart:convert';
import 'package:potea_app/core/models/user_model.dart';
import 'package:potea_app/core/services/prefs/prefs_keys.dart';
import 'package:potea_app/core/services/prefs/shared_preferences_singleton.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser(String uid);
  Future<void> clearUser(String uid);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Prefs prefs;

  AuthLocalDataSourceImpl({required this.prefs});

  @override
  Future<void> cacheUser(UserModel user) async {
    final userMap = user.toMap();
    final jsonString = json.encode(userMap);
    await Prefs.setString(PrefKeys.userKey(user.uid), jsonString);
  }

  @override
  Future<UserModel?> getCachedUser(String uid) async {
    final jsonString = Prefs.getString(PrefKeys.userKey(uid));
    // ignore: unnecessary_null_comparison
    if (jsonString == null) return null;
    final map = json.decode(jsonString);
    return UserModel.fromMap(map);
  }

  @override
  Future<void> clearUser(String uid) async {
    await Prefs.delete(PrefKeys.userKey(uid));
  }
}
