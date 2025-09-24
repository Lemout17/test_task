import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/const/icons.dart';
import 'package:test_task/screens/main_screen.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/coins_container.dart';
import 'package:test_task/widgets/common/menu_button_wrapper.dart';

class AppHeader extends StatelessWidget {
  final bool? withCoin;

  const AppHeader({super.key, this.withCoin = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenuButtonWrapper(
          onTap: () => backToMenu(context),
          child: SvgPicture.asset(AppIcons.back, height: SizeConfig.h(4)),
        ),
        if (withCoin == true) CoinsContainer(),
      ],
    );
  }

  void backToMenu(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder<Widget>(
        pageBuilder: (context, animation1, animation2) => const MainScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
