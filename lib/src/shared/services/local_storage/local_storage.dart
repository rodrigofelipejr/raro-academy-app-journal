import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<bool> set(String key, List<String> value) async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    return await _sharedPreferences.setStringList(key, value);
  }

  static Future<List<String>?> get(String key) async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getStringList(key);
  }
}
