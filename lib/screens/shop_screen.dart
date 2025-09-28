import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/models/shop_item_model.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/app_header.dart';
import 'package:test_task/widgets/common/menu_container.dart';
import 'package:test_task/widgets/shop_item.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      backgroundUrl: Assets.mainBg,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(7)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.h(3)),
                const AppHeader(withCoin: true),
                SizedBox(height: SizeConfig.h(3)),
                BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    final unlocked = state.userSettings.unlockedContents;
                    final bg = state.userSettings.bg;
                    final egg = state.userSettings.egg;
                    log('egg - $egg');
                    log('bg - $bg');
                    log('unlocked - $unlocked');

                    return MenuContainer(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () =>
                                context.read<AppCubit>().resetSettings(),
                            child: Text(
                              'Shop',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          SizedBox(height: SizeConfig.h(5)),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 30,
                                  mainAxisSpacing: 30,
                                ),
                            itemCount: shopItemsList.length,
                            itemBuilder: (context, index) {
                              final item = shopItemsList[index];
                              final isUnlocked = unlocked.contains(
                                item.content,
                              );
                              final isBackground = item.name.contains(
                                'Background',
                              );
                              final isUsed = (isBackground ? bg : egg).contains(
                                item.content.name,
                              );

                              log('isUsed - $isUsed');
                              log('item.content.name - ${item.content.name}');

                              return ShopItem(
                                item: item,
                                isUnlockedContent: isUnlocked,
                                isUsed: isUsed,
                                onTap: () {
                                  final cubit = context.read<AppCubit>();
                                  final success = cubit.buyOrEquipItem(item);

                                  if (!success) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Not enough coins'),
                                        backgroundColor: AppColors.red,
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
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
