import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/game/game.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/size_config.dart';

class EggCounterWidget extends PositionComponent
    with HasGameReference<CatchGame> {
  late SpriteComponent containerSprite;
  late TextComponent text;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final image = await game.images.load(Assets.eggsContainer);

    containerSprite = SpriteComponent(
      sprite: Sprite(image),
      size: Vector2(120, 50),
      anchor: Anchor.topLeft,
    );
    add(containerSprite);

    text = TextComponent(
      text: '0/${game.level.eggTarget}',
      anchor: Anchor.centerRight,
      position: containerSprite.size / 2 + Vector2(4, 0),
      textRenderer: TextPaint(
        style: TextStyle(
          fontSize: SizeConfig.font(2),
          color: AppColors.white,
          fontFamily: 'RubikMonoOne',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
    add(text);

    // Весь EggCounterWidget фиксируем в левом верхнем углу
    anchor = Anchor.topLeft;
    position = Vector2(8, 8); // отступ от левого и верхнего края
  }

  void updateCount(int value, int target) {
    text.text = '$value/$target';
  }
}
