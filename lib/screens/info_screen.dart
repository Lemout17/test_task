import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/app_header.dart';
import 'package:test_task/widgets/common/menu_container.dart';
import 'package:test_task/widgets/info_tile.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

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
                const AppHeader(withCoin: false),
                SizedBox(height: SizeConfig.h(5)),
                Expanded(
                  child: MenuContainer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'how to play',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: SizeConfig.h(2.5)),
                        Flexible(
                          child: Text(
                            'Catch falling eggs with your basket to complete the level.Every tenth missed egg takes away 1 life.',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        SizedBox(height: SizeConfig.h(2.5)),
                        InfoTile(
                          title: 'Frost Egg',
                          asset: Assets.frostEgg,
                          text:
                              'slows down the speed of egg falls for 5 seconds',
                        ),
                        SizedBox(height: SizeConfig.h(1.5)),
                        InfoTile(
                          title: 'Flame Egg',
                          asset: Assets.flameEgg,
                          text: 'doubles the number of coins and points',
                        ),
                        SizedBox(height: SizeConfig.h(1.5)),
                        InfoTile(
                          title: 'Poison Egg',
                          asset: Assets.poisonEgg,
                          text: 'takes one life',
                        ),
                        SizedBox(height: SizeConfig.h(1.5)),
                        Flexible(
                          flex: 2,
                          child: Image.asset(
                            'assets/images/${Assets.chickens}',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.h(3)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
