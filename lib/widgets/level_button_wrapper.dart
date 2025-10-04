import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/models/level_model.dart';
import 'package:test_task/navigation/routes.dart';
import 'package:test_task/utils/size_config.dart';

class LevelButtonWrapper extends StatelessWidget {
  final LevelModel level;
  final bool isLevelAvailable;

  const LevelButtonWrapper({
    super.key,
    required this.level,
    required this.isLevelAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: isLevelAvailable
          ? () => context.goNamed(AppRouteNames.game, extra: level)
          : null,
      child: Container(
        height: SizeConfig.h(10),
        width: SizeConfig.h(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              isLevelAvailable
                  ? 'assets/images/${Assets.buttonWrapper}'
                  : 'assets/images/${Assets.disabledLevel}',
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
