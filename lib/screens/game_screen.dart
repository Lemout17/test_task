import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/game/game.dart';
import 'package:test_task/models/level_model.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/game_lose_modal.dart';
import 'package:test_task/widgets/game_pause_modal.dart';
import 'package:test_task/widgets/game_win_modal.dart';

class GameScreen extends StatefulWidget {
  final LevelModel level;

  const GameScreen({super.key, required this.level});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late CatchGame game;

  @override
  void initState() {
    super.initState();
    final settings = context.read<AppCubit>().state.userSettings;
    final user = context.read<AppCubit>().state.user;

    game = CatchGame(level: widget.level, settings: settings, user: user);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      game.overlays.add('pauseButton');
    });
  }

  @override
  Widget build(BuildContext context) {
    log('currentLevel - ${widget.level.level}');

    return Scaffold(
      body: SafeArea(
        child: GameWidget<CatchGame>(
          game: game,
          overlayBuilderMap: {
            'win': (context, game) {
              win(context, game);
              return GameWinModal(
                score: game.score,
                currentLevel: widget.level.level,
                onRestart: () => restartGame(game),
              );
            },
            'lose': (context, game) {
              lose(context, game);

              return GameLoseModal(
                score: game.score,
                onRestart: () => restartGame(game),
              );
            },
            'pause': (context, game) => GamePauseModal(
              onResume: () => resumeGame(game),
              onRestart: () => restartGame(game),
            ),
            'pauseButton': (context, game) => Positioned(
              top: SizeConfig.h(4),
              right: SizeConfig.h(4),
              child: GestureDetector(
                onTap: () {
                  game.pauseEngine();
                  game.overlays.remove('pauseButton');
                  game.overlays.add('pause');
                },
                child: Image.asset(
                  'assets/images/${Assets.pause}',
                  width: SizeConfig.h(8),
                  height: SizeConfig.h(8),
                ),
              ),
            ),
          },
        ),
      ),
    );
  }

  void resumeGame(CatchGame game) {
    game.overlays.remove('pause');
    game.resumeEngine();
    game.overlays.add('pauseButton');
  }

  void restartGame(CatchGame game) {
    game.fullRestart();
    game.overlays.remove('win');
    game.overlays.remove('lose');
    game.overlays.remove('pause');
    game.resumeEngine();
    game.overlays.add('pauseButton');
  }

  Future<void> win(BuildContext context, CatchGame game) async {
    await context.read<AppCubit>().incrementLevel(widget.level.level);
    await context.read<AppCubit>().incrementCoins(game.coins);
    await context.read<AppCubit>().saveScore(game.score);
  }

  Future<void> lose(BuildContext context, CatchGame game) async {
    await context.read<AppCubit>().incrementCoins(game.coins);
    await context.read<AppCubit>().saveScore(game.score);
  }
}
