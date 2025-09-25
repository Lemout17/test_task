import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/navigation/routes.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/button_wrapper.dart';
import 'package:test_task/widgets/common/app_header.dart';
import 'package:test_task/widgets/common/menu_container.dart';
import 'package:test_task/widgets/common/stroke_text.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

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
                const AppHeader(),
                SizedBox(height: SizeConfig.h(5)),
                Expanded(
                  child: SingleChildScrollView(
                    child: MenuContainer(
                      child: Column(
                        children: [
                          SizedBox(height: SizeConfig.h(2)),
                          Text(
                            'menu',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: SizeConfig.h(3)),
                          ButtonWrapper(
                            onTap: () => context.goNamed(AppRouteNames.profile),
                            height: SizeConfig.h(10),
                            child: StrokeText(
                              'Profile',
                              size: SizeConfig.font(3),
                            ),
                          ),
                          SizedBox(height: SizeConfig.h(2)),
                          ButtonWrapper(
                            onTap: () =>
                                context.goNamed(AppRouteNames.settings),
                            height: SizeConfig.h(10),
                            child: StrokeText(
                              'settings',
                              size: SizeConfig.font(3),
                            ),
                          ),
                          SizedBox(height: SizeConfig.h(2)),
                          ButtonWrapper(
                            onTap: () =>
                                context.goNamed(AppRouteNames.leaderboard),
                            height: SizeConfig.h(10),
                            child: StrokeText(
                              'leaderboard',
                              size: SizeConfig.font(2.5),
                            ),
                          ),
                          SizedBox(height: SizeConfig.h(2)),
                          ButtonWrapper(
                            onTap: () => context.goNamed(AppRouteNames.privacy),
                            height: SizeConfig.h(10),
                            child: StrokeText(
                              'privacy \npolicy',
                              size: SizeConfig.font(3),
                            ),
                          ),
                          SizedBox(height: SizeConfig.h(2)),
                          ButtonWrapper(
                            onTap: () => context.goNamed(AppRouteNames.terms),
                            height: SizeConfig.h(10),
                            child: StrokeText(
                              'term\nof use',
                              size: SizeConfig.font(3),
                            ),
                          ),
                          SizedBox(height: SizeConfig.h(2)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
