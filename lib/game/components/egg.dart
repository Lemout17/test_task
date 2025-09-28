import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/game/components/basket.dart';
import 'package:test_task/game/game.dart';

enum EggType { normal, frost, flame, poison }

class Egg extends SpriteComponent
    with CollisionCallbacks, HasGameRef<CatchGame> {
  Vector2 baseVelocity = Vector2.zero();
  bool caught = false;
  final EggType type;

  Egg({this.type = EggType.normal});

  @override
  Future<void> onLoad() async {
    String asset = gameRef.settings.egg;

    switch (type) {
      case EggType.frost:
        asset = Assets.frostEgg;
        break;
      case EggType.flame:
        asset = Assets.flameEgg;
        break;
      case EggType.poison:
        asset = Assets.poisonEgg;
        break;
      case EggType.normal:
      default:
        asset = gameRef.settings.egg;
    }

    final image = await gameRef.images.load(asset);
    sprite = Sprite(image);

    size = Vector2(18 * 1.3, 22 * 1.3);
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    final multiplier = gameRef.slowMotionActive ? 0.5 : 1.0;
    position += baseVelocity * multiplier * dt;

    angle += 1.5 * dt;

    if (position.y > gameRef.size.y + 30 && !caught) {
      caught = true;
      removeFromParent();

      gameRef.missedEgg(this);

      if (type == EggType.poison) {
        gameRef.loseLife();
      }
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Basket && !caught) {
      caught = true;
      removeFromParent();

      switch (type) {
        case EggType.frost:
          gameRef.activateSlowMotion(5);
          gameRef.catchEgg(1);
          gameRef.addCoins(2);
          break;
        case EggType.flame:
          gameRef.catchEgg(2);
          gameRef.addCoins(4);
          break;
        case EggType.poison:
          gameRef.loseLife();
          break;
        case EggType.normal:
        default:
          gameRef.catchEgg(1);
          gameRef.addCoins(2);
          break;
      }
    }
  }
}
