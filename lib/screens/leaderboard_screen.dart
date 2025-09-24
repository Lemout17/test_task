import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/app_header.dart';
import 'package:test_task/widgets/common/menu_container.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

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
                SizedBox(height: SizeConfig.h(2)),
                Expanded(
                  child: MenuContainer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'leaderboard',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        ListView.builder(
                          itemBuilder: (context, index) => Stack(
                            alignment: Alignment.centerLeft,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: SizeConfig.w(0.5),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.w(5),
                                  vertical: SizeConfig.h(1.8),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.pink,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(SizeConfig.w(3)),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(),
                                    Text(
                                      'Username',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall,
                                    ),
                                    Text(
                                      '0000',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                Assets.buttonWrapper,
                                height: SizeConfig.h(7),
                              ),
                            ],
                          ),
                          shrinkWrap: true,
                          itemCount: 9,
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
