import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/models/level_model.dart';
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
      onTap: isLevelAvailable ? () => onTapSelectLevel(context) : null,
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

  void onTapSelectLevel(BuildContext context) {
    // Navigator.push(
    //   context,
    //   PageRouteBuilder<Widget>(
    //     pageBuilder: (context, animation1, animation2) =>
    //         GameScreen(level: level),
    //     transitionDuration: Duration.zero,
    //     reverseTransitionDuration: Duration.zero,
    //   ),
    // );
  }
}
