import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/utils/size_config.dart';

class MenuButtonWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const MenuButtonWrapper({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: SizeConfig.h(10),
        width: SizeConfig.h(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.buttonWrapper),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            SizedBox(height: SizeConfig.h(0.5)),
          ],
        ),
      ),
    );
  }
}
