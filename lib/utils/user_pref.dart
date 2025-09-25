import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/models/user_model.dart';

class UserPreferences {
  static const _userKey = "user_data";
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUser(UserModel user) async {
    await _prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  static UserModel? getUser() {
    final userJson = _prefs.getString(_userKey);
    if (userJson == null) return null;
    return UserModel.fromJson(jsonDecode(userJson));
  }

  static Future<void> updateUsername(String newUsername) async {
    final user = getUser();
    if (user == null) return;
    await saveUser(user.copyWith(username: newUsername));
  }

  static Future<void> updateEmail(String newEmail) async {
    final user = getUser();
    if (user == null) return;
    await saveUser(user.copyWith(email: newEmail));
  }

  static Future<void> updateUser({
    String? username,
    String? email,
    String? avatarUrl,
    int? coins,
  }) async {
    final user = getUser();
    if (user == null) return;
    await saveUser(user.copyWith(username: username, email: email));
  }

  static Future<void> clearUser() async {
    await _prefs.remove(_userKey);
  }
}
