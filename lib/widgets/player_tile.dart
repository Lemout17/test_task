import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/models/user_model.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/size_config.dart';

class PlayerTile extends StatelessWidget {
  final UserModel player;
  final bool isCurrent;

  const PlayerTile({super.key, required this.player, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(left: SizeConfig.w(0.5)),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(5),
            vertical: SizeConfig.h(1.8),
          ),
          decoration: BoxDecoration(
            color: AppColors.pink,
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.w(3))),
            border: isCurrent
                ? Border.all(color: AppColors.green, width: SizeConfig.w(0.5))
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text(
                player.username,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                player.score.toString(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
        Container(
          height: SizeConfig.h(7),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(3),
            vertical: SizeConfig.h(1),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.buttonWrapper),
              fit: BoxFit.contain,
              alignment: AlignmentGeometry.centerLeft,
            ),
          ),
          child: Image.asset(
            player.avatar,
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
            alignment: AlignmentGeometry.centerLeft,
          ),
        ),
      ],
    );
  }
}
