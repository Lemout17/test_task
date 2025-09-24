class LevelModel {
  final int maxPlanet;
  final int minSpeedPlanet;
  final int maxSpeedPlanet;
  final int stars;

  final bool isLock;

  LevelModel({
    required this.maxPlanet,
    required this.minSpeedPlanet,
    required this.maxSpeedPlanet,

    this.isLock = true,
    this.stars = 0,
  });

  LevelModel copyWith({int? stars, bool? isLock}) {
    return LevelModel(
      maxPlanet: maxPlanet,
      minSpeedPlanet: minSpeedPlanet,
      maxSpeedPlanet: maxSpeedPlanet,

      isLock: isLock ?? this.isLock,
      stars: stars ?? this.stars,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maxPlanet': maxPlanet,
      'minSpeedPlanet': minSpeedPlanet,
      'maxSpeedPlanet': maxSpeedPlanet,
      'stars': stars,
      'isLock': isLock,
    };
  }

  factory LevelModel.fromJson(Map<String, dynamic> json, {bool isLock = true}) {
    return LevelModel(
      maxPlanet: json['maxPlanet'],
      minSpeedPlanet: json['minSpeedPlanet'],
      maxSpeedPlanet: json['maxSpeedPlanet'],
      stars: json['stars'],
      isLock: json['isLock'] ?? isLock,
    );
  }
}
