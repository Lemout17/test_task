import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/const/levels.dart';
import 'package:test_task/navigation/routes.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/button_wrapper.dart';
import 'package:test_task/widgets/common/stroke_text.dart';

class GameWinModal extends StatefulWidget {
  const GameWinModal({
    required this.score,
    super.key,
    this.onRestart,
    required this.currentLevel,
  });

  final int score;
  final int currentLevel;
  final VoidCallback? onRestart;

  @override
  State<GameWinModal> createState() => _GameWinModalState();
}

class _GameWinModalState extends State<GameWinModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(color: Colors.black.withValues(alpha: .3)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'you win!',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: SizeConfig.font(8),
                    ),
                  ),
                ],
              ),
              BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  final bestScore = state.user.bestScore;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.h(3)),
                        _buildWrapper(
                          context,
                          'score',
                          widget.score.toString(),
                        ),
                        SizedBox(height: SizeConfig.h(2)),
                        _buildWrapper(context, 'best', bestScore.toString()),
                        SizedBox(height: SizeConfig.h(3)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () => context.go(AppRouteNames.main),
                              child: Text(
                                "Home",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
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
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.white,
                                      decorationThickness: 1.5,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              Spacer(flex: 1),
              ButtonWrapper(
                onTap: () => context.pushNamed(
                  AppRouteNames.game,
                  extra: widget.currentLevel == Levels.levels.last.level
                      ? Levels.levels.last
                      : Levels.levels[widget.currentLevel],
                ),
                height: SizeConfig.h(17),
                child: StrokeText('next', size: SizeConfig.font(9)),
              ),
              SizedBox(height: SizeConfig.h(8)),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildWrapper(BuildContext context, String text, String score) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(4),
        vertical: SizeConfig.h(1.5),
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.darkGreen, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(text, style: Theme.of(context).textTheme.headlineMedium),
          Text(score, style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }
}
