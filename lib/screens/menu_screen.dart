import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/screens/leaderboard_screen.dart';
import 'package:test_task/screens/privacy_Screen.dart';
import 'package:test_task/screens/profile_screen.dart';
import 'package:test_task/screens/settings_screen.dart';
import 'package:test_task/screens/terms_screen.dart';
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
                          SizedBox(height: SizeConfig.h(3)),
                          Text(
                            'menu',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: SizeConfig.h(3)),
                          ButtonWrapper(
                            onTap: () =>
                                navigateTo(context, const ProfileScreen()),
                            height: SizeConfig.h(10),
                            child: StrokeText(
                              'Profile',
                              size: SizeConfig.font(3),
                            ),
                          ),
                          SizedBox(height: SizeConfig.h(2)),
                          ButtonWrapper(
                            onTap: () =>
                                navigateTo(context, const SettingsScreen()),
                            height: SizeConfig.h(10),
                            child: StrokeText(
                              'settings',
                              size: SizeConfig.font(3),
                            ),
                          ),
                          SizedBox(height: SizeConfig.h(2)),
                          ButtonWrapper(
                            onTap: () =>
                                navigateTo(context, const LeaderboardScreen()),
                            height: SizeConfig.h(10),
                            child: StrokeText(
                              'leaderboard',
                              size: SizeConfig.font(2.5),
                            ),
                          ),
                          SizedBox(height: SizeConfig.h(2)),
                          ButtonWrapper(
                            onTap: () =>
                                navigateTo(context, const PrivacyScreen()),
                            height: SizeConfig.h(10),
                            child: StrokeText(
                              'privacy \npolicy',
                              size: SizeConfig.font(3),
                            ),
                          ),
                          SizedBox(height: SizeConfig.h(2)),
                          ButtonWrapper(
                            onTap: () =>
                                navigateTo(context, const TermsScreen()),
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

  void navigateTo(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder<Widget>(
        pageBuilder: (context, animation1, animation2) => screen,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
