import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/game/game.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/size_config.dart';

class CoinCounterWidget extends PositionComponent
    with HasGameReference<CatchGame> {
  SpriteComponent? containerSprite;
  TextComponent? text;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final image = await game.images.load(Assets.coinContainer);

    containerSprite = SpriteComponent(
      sprite: Sprite(image),
      size: Vector2(120, 50),
      anchor: Anchor.topLeft,
    );
    add(containerSprite!);

    text = TextComponent(
      text: '0',
      anchor: Anchor.centerRight,
      position: containerSprite!.size / 2 - Vector2(10, 0),
      textRenderer: TextPaint(
        style: TextStyle(
          fontSize: SizeConfig.font(2),
          color: AppColors.white,
          fontFamily: 'RubikMonoOne',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
    add(text!);

    position = Vector2(8, 8 + 60);
    anchor = Anchor.topLeft;
  }

  void updateCount(int value) {
    text?.text = value.toString();
  }
}
