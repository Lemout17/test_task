import 'package:test_task/const/assets.dart';

enum UnlockedContent {
  bg1,
  bg2,
  egg1,
  egg2,
  egg3,
  egg4;

  static UnlockedContent toEnum(String value) {
    return UnlockedContent.values.firstWhere((e) => e.name == value);
  }

  String get assetPath {
    switch (this) {
      case UnlockedContent.bg1:
        return Assets.bg1;
      case UnlockedContent.bg2:
        return Assets.bg2;
      case UnlockedContent.egg1:
        return Assets.egg1;
      case UnlockedContent.egg2:
        return Assets.egg2;
      case UnlockedContent.egg3:
        return Assets.egg3;
      case UnlockedContent.egg4:
        return Assets.egg4;
    }
  }
}

class UserSettingsModel {
  final bool isSoundOn;
  final bool isMusicOn;
  final bool isNotificationOn;
  final bool isVibrationOn;
  final int coins;
  final String bg;
  final String egg;
  final int currentLevel;
  final List<UnlockedContent> unlockedContents;

  UserSettingsModel({
    this.isSoundOn = true,
    this.isMusicOn = true,
    this.isNotificationOn = false,
    this.isVibrationOn = false,
    this.coins = 1000,
    String? bg,
    String? egg,
    this.currentLevel = 1,
    List<UnlockedContent>? unlockedContents,
  }) : bg = bg ?? Assets.bg1,
       egg = egg ?? Assets.egg1,
       unlockedContents =
           unlockedContents ??
           const [UnlockedContent.bg1, UnlockedContent.egg1];

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) {
    return UserSettingsModel(
      isSoundOn: json['isSoundOn'] as bool? ?? true,
      isMusicOn: json['isMusicOn'] as bool? ?? true,
      isNotificationOn: json['isNotificationOn'] as bool? ?? false,
      isVibrationOn: json['isVibrationOn'] as bool? ?? false,
      coins: json['coins'] as int? ?? 1000,
      bg: json['bg'] as String?,
      egg: json['egg'] as String?,
      currentLevel: json['currentLevel'] as int? ?? 1,
      unlockedContents:
          (json['unlockedContents'] as List<dynamic>?)
              ?.map((e) => UnlockedContent.toEnum(e as String))
              .toList() ??
          const [UnlockedContent.bg1, UnlockedContent.egg1],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isSoundOn': isSoundOn,
      'isMusicOn': isMusicOn,
      'isNotificationOn': isNotificationOn,
      'isVibrationOn': isVibrationOn,
      'coins': coins,
      'bg': bg,
      'egg': egg,
      'currentLevel': currentLevel,
      'unlockedContents': unlockedContents.map((e) => e.name).toList(),
    };
  }

  UserSettingsModel copyWith({
    bool? isSoundOn,
    bool? isMusicOn,
    bool? isNotificationOn,
    bool? isVibrationOn,
    int? coins,
    String? bg,
    String? egg,
    int? currentLevel,
    List<UnlockedContent>? unlockedContents,
  }) {
    return UserSettingsModel(
      isSoundOn: isSoundOn ?? this.isSoundOn,
      isMusicOn: isMusicOn ?? this.isMusicOn,
      isNotificationOn: isNotificationOn ?? this.isNotificationOn,
      isVibrationOn: isVibrationOn ?? this.isVibrationOn,
      coins: coins ?? this.coins,
      bg: bg ?? this.bg,
      egg: egg ?? this.egg,
      currentLevel: currentLevel ?? this.currentLevel,
      unlockedContents: unlockedContents ?? this.unlockedContents,
    );
  }
}
