class LevelModel {
  final int level;
  final int eggTarget;
  final double spawnSpeed;
  final double eggFallSpeed;

  LevelModel({
    required this.level,
    this.eggTarget = 20,
    this.spawnSpeed = 1.5,
    this.eggFallSpeed = 100,
  });
}
