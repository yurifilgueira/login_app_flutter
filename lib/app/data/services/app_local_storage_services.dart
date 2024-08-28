import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorageServices {
  static AppLocalStorageServices? _instance;
  static SharedPreferences? _preferences;

  static Future<AppLocalStorageServices> getInstance() async {
    _instance ??= AppLocalStorageServices();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  Future<bool> _saveData(String key, dynamic value) {
    if (value is String) {
      return _preferences!.setString(key, value);
    }
    if (value is bool) {
      return _preferences!.setBool(key, value);
    }
    if (value is int) {
      return _preferences!.setInt(key, value);
    }
    if (value is double) {
      return _preferences!.setDouble(key, value);
    }
    if (value is List<String>) {
      return _preferences!.setStringList(key, value);
    }
    throw Exception('Unsupported value type');
  }

  dynamic _getData(String key) {
    var value = _preferences!.get(key);
    return value;
  }

  Future<bool> removeData(String key) {
    return _preferences!.remove(key);
  }

  Future<bool> setUsername(String username) {
    return _saveData('username', username);
  }

  String getUsername() {
    return _getData('username');
  }

  Future<bool> setEmail(String email) {
    return _saveData('email', email);
  }

  String getEmail() {
    return _getData('email');
  }

  void clear() {
    _preferences!.clear();
  }
}
