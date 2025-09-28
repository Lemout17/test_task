import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:test_task/game/components/background.dart';
import 'package:test_task/game/components/basket.dart';
import 'package:test_task/game/components/coin_counter.dart';
import 'package:test_task/game/components/egg.dart';
import 'package:test_task/game/components/eggs_counter.dart';
import 'package:test_task/game/components/lives_counter.dart';
import 'package:test_task/models/level_model.dart';
import 'package:test_task/models/user_model.dart';
import 'package:test_task/models/user_settings_model.dart';

class CatchGame extends FlameGame
    with HasCollisionDetection, PanDetector, TapDetector {
  late Basket basket;
  final Random _rand = Random();
  double spawnTimer = 0;

  int score = 0;
  int caughtEggs = 0;
  int lives = 5;
  int coins = 0;

  late EggCounterWidget eggCounter;
  late CoinCounterWidget coinCounter;
  late LivesCounterWidget livesCounter;

  final LevelModel level;
  final UserSettingsModel settings;
  final UserModel user;

  CatchGame({
    super.children,
    super.world,
    super.camera,
    required this.level,
    required this.settings,
    required this.user,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(ScreenHitbox());

    _createBasket();
    add(Background(settings.bg));

    eggCounter = EggCounterWidget();
    add(eggCounter);

    coinCounter = CoinCounterWidget();
    add(coinCounter);
    coinCounter.updateCount(coins);

    livesCounter = LivesCounterWidget();
    add(livesCounter);
  }

  void _createBasket() {
    children.whereType<Basket>().toList().forEach((b) => b.removeFromParent());

    basket = Basket()
      ..anchor = Anchor.bottomCenter
      ..position = Vector2(size.x / 2, size.y - 0)
      ..size = Vector2(120, 40);
    add(basket);
  }

  @override
  void update(double dt) {
    super.update(dt);
    spawnTimer += dt;

    if (spawnTimer >= level.spawnSpeed) {
      spawnTimer = 0;
      spawnEggWave();
    }

    if (lives <= 0) {
      loseGame();
    }

    if (caughtEggs >= level.eggTarget) {
      winGame();
    }
  }

  void spawnEggWave() {
    final eggsCount = 1 + _rand.nextInt(2);
    for (int i = 0; i < eggsCount; i++) {
      final x = 20 + _rand.nextDouble() * (size.x - 40);

      final egg = Egg()
        ..position = Vector2(x, -10)
        ..anchor = Anchor.center;

      final baseSpeed = level.eggFallSpeed + caughtEggs * 1.0;
      egg.velocity = Vector2(0, baseSpeed + _rand.nextDouble() * 40);

      add(egg);
    }
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    final delta = info.delta.global;
    basket.position.add(Vector2(delta.x, 0));

    final halfWidth = basket.size.x / 2;
    if (basket.position.x < halfWidth) basket.position.x = halfWidth;
    if (basket.position.x > size.x - halfWidth)
      basket.position.x = size.x - halfWidth;
  }

  @override
  void onTapDown(TapDownInfo info) {
    final pos = info.eventPosition.global;
    basket.position.x = pos.x;
  }

  /// Ловим яйцо: увеличиваем пойманные яйца, очки и монеты
  void catchEgg(int points) {
    caughtEggs += 1;
    score += points;
    coins += 2; // добавляем 2 коина за яйцо

    eggCounter.updateCount(caughtEggs, level.eggTarget);
    coinCounter.updateCount(coins);
  }

  void loseLife() {
    lives -= 1;
    livesCounter.updateCount(lives); // обновляем LivesCounter
  }

  void fullRestart() {
    children.whereType<Egg>().toList().forEach((e) => e.removeFromParent());
    basket.removeFromParent();

    score = 0;
    caughtEggs = 0;
    lives = 5;
    coins = 0;

    eggCounter.updateCount(0, level.eggTarget);
    coinCounter.updateCount(0);

    _createBasket();
    spawnTimer = 0;
    resumeEngine();
  }

  void loseGame() {
    if (!overlays.isActive('lose')) {
      overlays.add('lose');
      pauseEngine();
    }
  }

  void winGame() {
    if (!overlays.isActive('win')) {
      overlays.add('win');
      pauseEngine();
    }
  }

  void pauseGame() {
    if (!overlays.isActive('pause')) {
      overlays.add('pause');
      pauseEngine();
    }
  }
}
