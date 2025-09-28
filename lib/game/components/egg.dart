import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:test_task/game/components/basket.dart';
import 'package:test_task/game/game.dart';

class Egg extends SpriteComponent
    with CollisionCallbacks, HasGameRef<CatchGame> {
  Vector2 velocity = Vector2.zero();
  bool caught = false;
  final int points;

  Egg({this.points = 10});

  @override
  Future<void> onLoad() async {
    final image = await gameRef.images.load(gameRef.settings.egg);
    sprite = Sprite(image);

    size = Vector2(18, 22);
    add(RectangleHitbox());

    await super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += velocity * dt;
    angle += 1.5 * dt;

    if (position.y > gameRef.size.y + 30 && !caught) {
      caught = true;
      removeFromParent();
      gameRef.loseLife();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Basket && !caught) {
      caught = true;
      removeFromParent();

      gameRef.catchEgg(points);
    }
  }
}
