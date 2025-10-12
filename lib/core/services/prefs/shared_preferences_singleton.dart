import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late Prefs instance;
  final SharedPreferences _prefs;

  Prefs._(this._prefs);

  /// initialize once (call it in setupGetIt or main)
  static Future<Prefs> init() async {
    final prefs = await SharedPreferences.getInstance();
    instance = Prefs._(prefs);
    return instance;
  }

  // -------- Static Access (shortcuts) --------
  static Future<void> setString(String key, String value) async {
    await instance._prefs.setString(key, value);
  }

  static String getString(String key, {String defaultValue = ""}) {
    return instance._prefs.getString(key) ?? defaultValue;
  }

  static Future<void> setBool(String key, bool value) async {
    await instance._prefs.setBool(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return instance._prefs.getBool(key) ?? defaultValue;
  }

  // -------- Instance Access (for DI / testing) --------
  Future<void> setStringInstance(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String getStringInstance(String key, {String defaultValue = ""}) {
    return _prefs.getString(key) ?? defaultValue;
  }

  Future<void> setBoolInstance(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool getBoolInstance(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }
}
