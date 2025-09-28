import 'package:flame/components.dart';
import 'package:test_task/game/game.dart';

class Background extends SpriteComponent with HasGameReference<CatchGame> {
  Background(this.bg);

  final String bg;

  @override
  Future<void> onLoad() async {
    final image = await game.images.load(bg);

    sprite = Sprite(image);
    size = game.size;
    position = Vector2.zero();
    priority = -1;
  }
}
