import 'package:test_task/models/level_model.dart';

class Levels {
  static List<LevelModel> list = [
    LevelModel(
      maxPlanet: 4,
      minSpeedPlanet: 100,
      maxSpeedPlanet: 300,
      isLock: false,
    ),
    LevelModel(
      maxPlanet: 3,
      minSpeedPlanet: 150,
      maxSpeedPlanet: 300,
      isLock: true,
    ),
    LevelModel(
      maxPlanet: 2,
      minSpeedPlanet: 200,
      maxSpeedPlanet: 300,
      isLock: true,
    ),
    LevelModel(
      maxPlanet: 2,
      minSpeedPlanet: 350,
      maxSpeedPlanet: 500,
      isLock: true,
    ),
  ];
}
