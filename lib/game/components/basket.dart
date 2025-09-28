import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import 'package:test_task/game/game.dart';

class Basket extends PositionComponent
    with CollisionCallbacks, HasGameRef<CatchGame> {
  late SpriteComponent chicken;

  Basket() {
    add(RectangleHitbox());
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    size = Vector2(120, 40);

    anchor = Anchor.bottomCenter;

    position = Vector2(gameRef.size.x / 2, gameRef.size.y);

    final image = await gameRef.images.load(gameRef.user.avatar.assetPath);
    final sprite = Sprite(image);

    final chickenHeight = 80.0;
    final chickenWidth = 60.0;

    chicken = SpriteComponent(
      sprite: sprite,
      size: Vector2(chickenWidth, chickenHeight),
      anchor: Anchor.bottomLeft,
      position: Vector2(-chickenWidth, 38),
    );

    add(chicken);
  }

  @override
  void render(Canvas canvas) {
    final r = RRect.fromRectAndRadius(size.toRect(), const Radius.circular(8));
    final paint = Paint()..color = Colors.brown;
    canvas.drawRRect(r, paint);

    final inner = Rect.fromLTWH(4, 6, size.x - 8, size.y - 12);
    canvas.drawRect(inner, Paint()..color = Colors.orange.shade700);
  }
}
