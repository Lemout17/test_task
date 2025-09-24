import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/utils/size_config.dart';

class ButtonWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? height;

  const ButtonWrapper({
    super.key,
    required this.child,
    this.onTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: height ?? SizeConfig.h(15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.button),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
