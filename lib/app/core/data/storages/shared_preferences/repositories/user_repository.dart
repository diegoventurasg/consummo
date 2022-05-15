import 'package:shared_preferences/shared_preferences.dart';

abstract class IUserRepositoryDao {
  Future<Map<String, dynamic>?> getLoggedInUser();
  Future<bool> setLoggedInUser(Map<String, dynamic> user);
}

class UserRepositoryDao implements IUserRepositoryDao {
  SharedPreferences? _prefs;

  Future<SharedPreferences> get _preferences async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  UserRepositoryDao();

  @override
  Future<Map<String, dynamic>?> getLoggedInUser() async {
    final SharedPreferences prefs = (await _preferences);

    if (prefs.containsKey("user_id") && prefs.containsKey("user_name")) {
      int? userId = prefs.getInt("user_id");
      String? userName = prefs.getString("user_name");

      if (userId != null && userName != null) {
        Map<String, dynamic> user = {
          "id": userId,
          "name": userName,
        };

        return user;
      }
    }

    return null;
  }

  @override
  Future<bool> setLoggedInUser(Map<String, dynamic> user) async {
    final SharedPreferences prefs = (await _preferences);

    if (user.containsKey('id') && user.containsKey('name')) {
      prefs.setInt('user_id', user['id'] as int);
      prefs.setString('user_name', user['name'] as String);
      return true;
    }

    return false;
  }
}
