class UserModel {
  final String username;
  final String email;
  final String avatar;

  UserModel({
    this.username = 'user',
    this.email = '',
    this.avatar = 'assets/images/chicken2.png',
  });

  Map<String, dynamic> toJson() {
    return {"username": username, "email": email, "avatar": avatar};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json["username"] ?? 'user',
      email: json["email"] ?? '',
      avatar: json["avatar"] ?? 'assets/images/chicken1.png',
    );
  }

  UserModel copyWith({String? username, String? email, String? avatar}) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }
}
