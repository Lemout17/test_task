// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/screens/menu_screen.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/layout_wrapper.dart';
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

  //     Future.delayed(const Duration(seconds: 0), () {
  //       Navigator.pushReplacement(
  //         context,
  //         PageRouteBuilder(
  //           pageBuilder: (context, animation1, animation2) =>
  //               const MenuScreen(),
  //           transitionDuration: Duration.zero,
  //           reverseTransitionDuration: Duration.zero,
  //         ),
  //       );
  //     });
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
              padding: const EdgeInsets.all(87),
              child: AnimatedGradientLoader(
                duration: Duration(seconds: 5),
                height: 30,
                borderRadius: 16,
                gradient: LinearGradient(colors: [Colors.pink, Colors.orange]),
                onCompleted: () => print('Готово'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
