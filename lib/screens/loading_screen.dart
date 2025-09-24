// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/screens/main_screen.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/animated_loader.dart';
import 'package:test_task/widgets/common/stroke_text.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     for (var asset in assetsMap.values) {
  //       await ImageLoader().loadImage(asset);
  //     }

  //     await context.read<AudioService>().loadSounds(soundsMap);
  //     await context.read<AppCubit>().loadLevels();

  //     context.read<AudioService>().stopBackgroundMusic();
  //     context.read<AudioService>().loopSound('background_sound');

  //   });
  // }

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
                borderRadiusOutter: 16,
                borderRadiusInner: 16,
                onCompleted: navigateToMenu,
              ),
            ),
            SizedBox(height: SizeConfig.h(5)),
          ],
        ),
      ),
    );
  }

  void navigateToMenu() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }
}
