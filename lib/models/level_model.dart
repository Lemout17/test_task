class LevelModel {
  const LevelModel({
    required this.level,
    required this.shots,
    required this.coinTarget,
    this.speedMultiplier = 1.0,
    this.maxConcurrent = 1,
    this.emptySpawns = false,
    this.directionalChange = false,
    this.fakePlates = false,
    this.randomSize = false,
  });
  final int level;
  final int shots;
  final int coinTarget;
  final double speedMultiplier;
  final int maxConcurrent;
  final bool emptySpawns;
  final bool directionalChange;
  final bool fakePlates;
  final bool randomSize;
}
