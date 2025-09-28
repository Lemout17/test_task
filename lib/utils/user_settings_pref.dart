import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/models/user_settings_model.dart';

class UserSettingsController extends ChangeNotifier {
  static const _settingsKey = 'user_settings';
  static late SharedPreferences _prefs;

  late UserSettingsModel _settings;

  UserSettingsModel get settings => _settings;

  static Future<UserSettingsController> init() async {
    _prefs = await SharedPreferences.getInstance();

    final controller = UserSettingsController._privateConstructor();
    controller._loadSettings();
    return controller;
  }

  UserSettingsController._privateConstructor();

  void _loadSettings() {
    final jsonString = _prefs.getString(_settingsKey);
    if (jsonString == null) {
      _settings = UserSettingsModel();
    } else {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      _settings = UserSettingsModel.fromJson(jsonMap);
    }
    notifyListeners();
  }

  Future<void> _saveSettings() async {
    await _prefs.setString(_settingsKey, jsonEncode(_settings.toJson()));
    notifyListeners();
  }

  Future<void> update({
    bool? isSoundOn,
    bool? isMusicOn,
    bool? isNotificationOn,
    bool? isVibrationOn,
    int? coins,
    String? bg,
    int? currentLevel,
    List<UnlockedContent>? unlockedContents,
  }) async {
    _settings = _settings.copyWith(
      isSoundOn: isSoundOn,
      isMusicOn: isMusicOn,
      isNotificationOn: isNotificationOn,
      isVibrationOn: isVibrationOn,
      coins: coins,
      bg: bg,
      currentLevel: currentLevel,
      unlockedContents: unlockedContents,
    );
    await _saveSettings();
  }

  Future<void> clear() async {
    _settings = UserSettingsModel();
    await _prefs.remove(_settingsKey);
    notifyListeners();
  }
}
