class UserModel {
  final String username;
  final String email;
  final String avatar;
  final int score;

  UserModel({
    this.username = '',
    this.email = '',
    this.avatar = 'assets/images/chicken2.png',
    this.score = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "avatar": avatar,
      "score": score,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json["username"] ?? '',
      email: json["email"] ?? '',
      avatar: json["avatar"] ?? 'assets/images/chicken1.png',
      score: json["score"] ?? 0,
    );
  }

  UserModel copyWith({
    String? username,
    String? email,
    String? avatar,
    int? score,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      score: score ?? this.score,
    );
  }
}
