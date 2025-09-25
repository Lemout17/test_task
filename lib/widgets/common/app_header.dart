import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task/const/icons.dart';
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
          onTap: () => context.pop(),
          child: SvgPicture.asset(AppIcons.back, height: SizeConfig.h(4)),
        ),
        if (withCoin == true) CoinsContainer(),
      ],
    );
  }
}
