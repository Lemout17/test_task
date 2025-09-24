import 'package:flutter/material.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/size_config.dart';

class MenuContainer extends StatelessWidget {
  final Widget child;
  const MenuContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(2),
        horizontal: SizeConfig.w(5),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.pink, width: 2.5),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.purple.withValues(alpha: 0.8),
      ),
      child: child,
    );
  }
}
