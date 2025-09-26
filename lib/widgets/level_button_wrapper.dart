import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/models/level_model.dart';
import 'package:test_task/utils/size_config.dart';

class LevelButtonWrapper extends StatelessWidget {
  final LevelModel level;
  final bool isLevelAvailable;
  final VoidCallback? onTap;

  const LevelButtonWrapper({
    super.key,
    required this.level,
    required this.isLevelAvailable,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: SizeConfig.h(10),
        width: SizeConfig.h(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              isLevelAvailable ? Assets.buttonWrapper : Assets.disabledLevel,
            ),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: Text(
            '${level.level}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
