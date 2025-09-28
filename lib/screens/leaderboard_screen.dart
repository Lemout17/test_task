import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/resources/players_list.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/app_header.dart';
import 'package:test_task/widgets/common/menu_container.dart';
import 'package:test_task/widgets/player_tile.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      backgroundUrl: Assets.mainBg,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(7)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.h(3)),
                const AppHeader(withCoin: false),
                SizedBox(height: SizeConfig.h(2)),
                Expanded(
                  child: MenuContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'leaderboard',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: SizeConfig.h(2)),
                        BlocBuilder<AppCubit, AppState>(
                          builder: (context, state) {
                            final currentPlayer = state.user;
                            final sortedPlayers =
                                [...playersList, currentPlayer]..sort(
                                  (a, b) => b.bestScore.compareTo(a.bestScore),
                                );

                            return Expanded(
                              child: ListView.builder(
                                itemCount: sortedPlayers.length,
                                itemBuilder: (context, index) {
                                  final player = sortedPlayers[index];

                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: SizeConfig.h(1),
                                    ),
                                    child: PlayerTile(
                                      player: player,
                                      isCurrent:
                                          player.email == currentPlayer.email,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.h(3)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
