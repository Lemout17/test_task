import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/const/icons.dart';
import 'package:test_task/screens/info_screen.dart';
import 'package:test_task/screens/level_select_screen.dart';
import 'package:test_task/screens/menu_screen.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/button_wrapper.dart';
import 'package:test_task/widgets/common/menu_button_wrapper.dart';
import 'package:test_task/widgets/common/stroke_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BackgroundWrapper(
          backgroundUrl: Assets.menuBg,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(7)),
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.h(3)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuButtonWrapper(
                          onTap: () => navigateTo(InfoScreen()),
                          child: SvgPicture.asset(
                            AppIcons.info,
                            height: SizeConfig.h(4),
                          ),
                        ),
                        MenuButtonWrapper(
                          onTap: () => navigateTo(MenuScreen()),
                          child: SvgPicture.asset(
                            AppIcons.burger,
                            height: SizeConfig.h(3.5),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ButtonWrapper(
                      onTap: () => navigateTo(LevelSelectScreen()),
                      height: SizeConfig.h(17),
                      child: StrokeText('PLAY', size: SizeConfig.font(9)),
                    ),
                    SizedBox(height: SizeConfig.h(5)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void navigateTo(Widget screen) {
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
