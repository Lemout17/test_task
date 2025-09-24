import 'package:test_task/models/level_model.dart';

class Levels {
  static const List<LevelModel> levels = [
    LevelModel(level: 1, shots: 10, coinTarget: 200),
    LevelModel(level: 2, shots: 10, coinTarget: 400, speedMultiplier: 1.2),
    LevelModel(
      level: 3,
      shots: 10,
      coinTarget: 550,
      speedMultiplier: 1.2,
      maxConcurrent: 3,
    ),
    LevelModel(
      level: 4,
      shots: 9,
      coinTarget: 700,
      speedMultiplier: 1.4,
      emptySpawns: true,
    ),
    LevelModel(
      level: 5,
      shots: 9,
      coinTarget: 800,
      speedMultiplier: 1.4,
      directionalChange: true,
    ),
    LevelModel(
      level: 6,
      shots: 8,
      coinTarget: 950,
      speedMultiplier: 1.6,
      fakePlates: true,
    ),
    LevelModel(
      level: 7,
      shots: 8,
      coinTarget: 1100,
      speedMultiplier: 1.6,
      fakePlates: true,
    ),
    LevelModel(
      level: 8,
      shots: 7,
      coinTarget: 1500,
      speedMultiplier: 2.0,
      directionalChange: true,
      fakePlates: true,
      randomSize: true,
    ),
    LevelModel(
      level: 9,
      shots: 6,
      coinTarget: 1900,
      speedMultiplier: 2.0,
      directionalChange: true,
      fakePlates: true,
      randomSize: true,
    ),
  ];
}
