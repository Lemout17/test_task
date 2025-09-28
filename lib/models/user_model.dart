import 'package:test_task/const/assets.dart';

enum AvatarType {
  chicken1,
  chicken2;

  static AvatarType toEnum(String value) {
    return AvatarType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => AvatarType.chicken1,
    );
  }

  String get assetPath {
    switch (this) {
      case AvatarType.chicken1:
        return Assets.chicken1;
      case AvatarType.chicken2:
        return Assets.chicken2;
    }
  }
}

class UserModel {
  final String username;
  final String email;
  final AvatarType avatar;
  final int score;
  final int bestScore;

  UserModel({
    this.username = '',
    this.email = '',
    this.avatar = AvatarType.chicken1,
    this.score = 0,
    this.bestScore = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "avatar": avatar.name, // сохраняем имя enum-а
      "score": score,
      "bestScore": bestScore,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json["username"] ?? '',
      email: json["email"] ?? '',
      avatar: AvatarType.toEnum(json["avatar"] ?? 'chicken1'),
      score: json["score"] ?? 0,
      bestScore: json["bestScore"] ?? 0,
    );
  }

  UserModel copyWith({
    String? username,
    String? email,
    AvatarType? avatar,
    int? score,
    int? bestScore,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      score: score ?? this.score,
      bestScore: bestScore ?? this.bestScore,
    );
  }
}
