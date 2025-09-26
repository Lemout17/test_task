import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/const/levels.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/app_header.dart';
import 'package:test_task/widgets/level_button_wrapper.dart';

class LevelSelectScreen extends StatelessWidget {
  const LevelSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      backgroundUrl: Assets.mainBg,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(7)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.h(3)),
                AppHeader(),
                SizedBox(height: SizeConfig.h(2)),
                Text(
                  'change level',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: SizeConfig.h(8)),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 35,
                  ),
                  itemCount: Levels.levels.length,
                  itemBuilder: (context, index) {
                    final level = Levels.levels[index];

                    return LevelButtonWrapper(
                      level: level,
                      isLevelAvailable: true,
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
