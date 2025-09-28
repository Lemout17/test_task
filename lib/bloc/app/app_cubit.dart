import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/const/levels.dart';
import 'package:test_task/models/shop_item_model.dart';
import 'package:test_task/models/user_model.dart';
import 'package:test_task/models/user_settings_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  static const _userKey = 'user_data';
  static const _settingsKey = 'user_settings';
  static late SharedPreferences _prefs;

  AppCubit({required UserModel user, required UserSettingsModel userSettings})
    : super(AppState(user: user, userSettings: userSettings));

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<AppCubit> load() async {
    await init();

    final userJson = _prefs.getString(_userKey);
    final user = userJson != null
        ? UserModel.fromJson(jsonDecode(userJson))
        : UserModel();

    final settingsJson = _prefs.getString(_settingsKey);
    final settings = settingsJson != null
        ? UserSettingsModel.fromJson(jsonDecode(settingsJson))
        : UserSettingsModel();

    return AppCubit(user: user, userSettings: settings);
  }

  Future<void> updateUser({
    String? username,
    String? email,
    AvatarType? avatar,
    int? score,
    int? bestScore,
  }) async {
    final updatedUser = state.user.copyWith(
      username: username,
      email: email,
      avatar: avatar,
      score: score,
      bestScore: bestScore,
    );

    emit(state.copyWith(user: updatedUser, userSettings: state.userSettings));
    await _prefs.setString(_userKey, jsonEncode(updatedUser.toJson()));
  }

  Future<void> updateSettings({
    bool? isSoundOn,
    bool? isMusicOn,
    bool? isNotificationOn,
    bool? isVibrationOn,
    int? coins,
    String? bg,
    String? egg,
    int? currentLevel,
    List<UnlockedContent>? unlockedContents,
  }) async {
    final updatedSettings = state.userSettings.copyWith(
      isSoundOn: isSoundOn,
      isMusicOn: isMusicOn,
      isNotificationOn: isNotificationOn,
      isVibrationOn: isVibrationOn,
      coins: coins,
      bg: bg,
      egg: egg,
      currentLevel: currentLevel,
      unlockedContents: unlockedContents,
    );

    emit(state.copyWith(user: state.user, userSettings: updatedSettings));
    await _prefs.setString(_settingsKey, jsonEncode(updatedSettings.toJson()));
  }

  bool buyOrEquipItem(ShopItemModel item) {
    final coins = state.userSettings.coins;
    final unlocked = state.userSettings.unlockedContents;
    final isUnlocked = unlocked.contains(item.content);
    final isBackground = item.name.contains('Background');

    if (!isUnlocked && coins < item.price) {
      return false;
    }

    if (!isUnlocked) {
      final newUnlocked = [...unlocked, item.content];
      if (isBackground) {
        updateSettings(
          coins: coins - item.price,
          unlockedContents: newUnlocked,
          bg: item.content.assetPath,
        );
      } else {
        updateSettings(
          coins: coins - item.price,
          unlockedContents: newUnlocked,
          egg: item.content.assetPath,
        );
      }
    } else {
      if (isBackground) {
        updateSettings(bg: item.content.assetPath);
      } else {
        updateSettings(egg: item.content.assetPath);
      }
    }

    return true;
  }

  Future<void> incrementLevel(int level) async {
    if (level == Levels.levels.length ||
        state.userSettings.currentLevel > level) {
      return;
    }

    updateSettings(currentLevel: level + 1);
  }

  Future<void> saveScore(int score) async {
    if (state.user.bestScore < score) {
      updateUser(bestScore: score);
    }

    updateUser(score: score);
  }

  Future<void> incrementCoins(int coins) async {
    updateSettings(coins: state.userSettings.coins + coins);
  }

  Future<void> resetSettings() async {
    final defaultSettings = UserSettingsModel();
    emit(state.copyWith(user: state.user, userSettings: defaultSettings));
    await _prefs.remove(_settingsKey);
  }

  Future<void> clearUser() async {
    final defaultUser = UserModel();
    emit(state.copyWith(user: defaultUser, userSettings: state.userSettings));
    await _prefs.remove(_userKey);
  }
}
