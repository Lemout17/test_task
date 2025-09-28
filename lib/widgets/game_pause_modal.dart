import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task/navigation/routes.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/button_wrapper.dart';
import 'package:test_task/widgets/common/stroke_text.dart';

class GamePauseModal extends StatefulWidget {
  const GamePauseModal({super.key, this.onResume, this.onRestart});

  final VoidCallback? onResume;
  final VoidCallback? onRestart;

  @override
  State<GamePauseModal> createState() => _GamePauseModalState();
}

class _GamePauseModalState extends State<GamePauseModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(color: Colors.black.withValues(alpha: .3)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 2),
                Text(
                  'paused',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: SizeConfig.font(8),
                  ),
                ),
                SizedBox(height: SizeConfig.h(6)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => context.goNamed(AppRouteNames.main),
                      child: Text(
                        "Home",
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.white,
                              decorationThickness: 1.5,
                            ),
                      ),
                    ),
                    TextButton(
                      onPressed: widget.onRestart,
                      child: Text(
                        "Restart",
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.white,
                              decorationThickness: 1.5,
                            ),
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 1),
                ButtonWrapper(
                  onTap: widget.onResume,
                  height: SizeConfig.h(17),
                  child: StrokeText('Play', size: SizeConfig.font(9)),
                ),
                SizedBox(height: SizeConfig.h(8)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
