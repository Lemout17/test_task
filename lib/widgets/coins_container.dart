import 'package:flutter/material.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/size_config.dart';

class CoinsContainer extends StatelessWidget {
  const CoinsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerRight,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: SizeConfig.w(7),
            right: SizeConfig.w(15),
            top: SizeConfig.h(1),
            bottom: SizeConfig.h(1),
          ),
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.red, width: 2),
          ),
          child: Text('14', style: Theme.of(context).textTheme.headlineSmall),
        ),
        Positioned(
          right: SizeConfig.w(-4),
          child: Image.asset('assets/images/coin.png', height: SizeConfig.h(7)),
        ),
      ],
    );
  }
}
