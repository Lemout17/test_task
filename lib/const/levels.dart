import 'package:test_task/models/level_model.dart';

class Levels {
  static final List<LevelModel> levels = List.generate(9, (index) {
    final levelNumber = index + 1;

    final eggTarget = 30 + index * 6;
    final spawnSpeed = 1.5 - index * 0.1;
    final eggFallSpeed = 100.0 + index * 20;

    return LevelModel(
      level: levelNumber,
      eggTarget: eggTarget,
      spawnSpeed: spawnSpeed.clamp(0.5, 1.5),
      eggFallSpeed: eggFallSpeed,
    );
  });
}
