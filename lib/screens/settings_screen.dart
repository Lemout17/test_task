import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/app_header.dart';
import 'package:test_task/widgets/common/button_wrapper.dart';
import 'package:test_task/widgets/common/menu_container.dart';
import 'package:test_task/widgets/common/stroke_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                const Spacer(flex: 1),
                Flexible(
                  flex: 3,
                  child: MenuContainer(
                    child: BlocBuilder<AppCubit, AppState>(
                      builder: (context, state) {
                        final settings = state.userSettings;

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Settings',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            SizedBox(height: SizeConfig.h(2)),
                            _buildSwitchRow(
                              context: context,
                              title: 'music',
                              value: settings.isMusicOn,
                              onChanged: (val) {
                                context.read<AppCubit>().updateSettings(
                                  isMusicOn: val,
                                );
                              },
                            ),
                            _buildSwitchRow(
                              context: context,
                              title: 'sound',
                              value: settings.isSoundOn,
                              onChanged: (val) {
                                context.read<AppCubit>().updateSettings(
                                  isSoundOn: val,
                                );
                              },
                            ),
                            _buildSwitchRow(
                              context: context,
                              title: 'notification',
                              value: settings.isNotificationOn,
                              onChanged: (val) {
                                context.read<AppCubit>().updateSettings(
                                  isNotificationOn: val,
                                );
                              },
                            ),
                            _buildSwitchRow(
                              context: context,
                              title: 'vibration',
                              value: settings.isVibrationOn,
                              onChanged: (val) {
                                context.read<AppCubit>().updateSettings(
                                  isVibrationOn: val,
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                ButtonWrapper(
                  onTap: () {
                    final state = context.read<AppCubit>().state;
                    debugPrint('music: ${state.userSettings.isMusicOn}');
                    debugPrint('sound: ${state.userSettings.isSoundOn}');
                    debugPrint(
                      'notification: ${state.userSettings.isNotificationOn}',
                    );
                    debugPrint(
                      'vibration: ${state.userSettings.isVibrationOn}',
                    );
                  },
                  height: SizeConfig.h(15),
                  child: StrokeText('save', size: SizeConfig.font(8)),
                ),
                SizedBox(height: SizeConfig.h(1.5)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchRow({
    required BuildContext context,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.copyWith(fontSize: SizeConfig.font(3)),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: AppColors.white,
          activeTrackColor: AppColors.green,
          inactiveThumbColor: AppColors.white,
          inactiveTrackColor: AppColors.grey,
        ),
      ],
    );
  }
}
