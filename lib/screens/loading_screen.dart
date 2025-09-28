import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/animated_loader.dart';

import '../navigation/routes.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      backgroundUrl: Assets.loadingBg,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(10)),
              child: AnimatedGradientLoader(
                duration: Duration(seconds: 5),
                height: SizeConfig.h(5.5),
                borderRadiusOuter: 16,
                borderRadiusInner: 16,
                onCompleted: () => context.goNamed(AppRouteNames.main),
              ),
            ),
            SizedBox(height: SizeConfig.h(5)),
          ],
        ),
      ),
    );
  }
}
