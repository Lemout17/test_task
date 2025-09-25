import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/app_header.dart';
import 'package:test_task/widgets/common/menu_container.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

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
                BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    final avatar = state.user.avatar;
                    final avatars = [Assets.chicken1, Assets.chicken2];

                    return MenuContainer(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Choose avatar',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: SizeConfig.h(3)),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(SizeConfig.w(5)),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: SizeConfig.h(3),
                                  crossAxisSpacing: SizeConfig.w(3),
                                  childAspectRatio: 1,
                                ),
                            itemCount: avatars.length,
                            itemBuilder: (context, index) {
                              final asset = avatars[index];
                              final isSelected = avatar == asset;

                              return GestureDetector(
                                onTap: () {
                                  context.read<AppCubit>().updateUser(
                                    avatar: asset,
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(SizeConfig.w(5)),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColors.green
                                          : Colors.white,
                                      width: 2,
                                    ),
                                    color: isSelected
                                        ? AppColors.green.withOpacity(0.3)
                                        : Colors.transparent,
                                  ),
                                  child: Image.asset(
                                    asset,
                                    fit: BoxFit.contain,
                                  ),
                                ),
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
