import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/navigation/routes.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/button_wrapper.dart';
import 'package:test_task/widgets/common/stroke_text.dart';

class GameLoseModal extends StatefulWidget {
  const GameLoseModal({required this.score, super.key, this.onRestart});

  final VoidCallback? onRestart;

  final int score;

  @override
  State<GameLoseModal> createState() => _GameLoseModalState();
}

class _GameLoseModalState extends State<GameLoseModal> {
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
                    'you lose!',
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
                      ],
                    ),
                  );
                },
              ),
              Spacer(flex: 1),
              ButtonWrapper(
                onTap: widget.onRestart,
                height: SizeConfig.h(17),
                child: StrokeText('try\nagain', size: SizeConfig.font(5.5)),
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
