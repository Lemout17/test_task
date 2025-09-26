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

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _music;
  late bool _sound;
  late bool _notification;
  late bool _vibration;

  @override
  void initState() {
    super.initState();
    final settings = context.read<AppCubit>().state.userSettings;
    _music = settings.isMusicOn;
    _sound = settings.isSoundOn;
    _notification = settings.isNotificationOn;
    _vibration = settings.isVibrationOn;
  }

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
                    child: Column(
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
                          value: _music,
                          onChanged: (val) => setState(() => _music = val),
                        ),
                        _buildSwitchRow(
                          context: context,
                          title: 'sound',
                          value: _sound,
                          onChanged: (val) => setState(() => _sound = val),
                        ),
                        _buildSwitchRow(
                          context: context,
                          title: 'notification',
                          value: _notification,
                          onChanged: (val) =>
                              setState(() => _notification = val),
                        ),
                        _buildSwitchRow(
                          context: context,
                          title: 'vibration',
                          value: _vibration,
                          onChanged: (val) => setState(() => _vibration = val),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                ButtonWrapper(
                  onTap: () {
                    context.read<AppCubit>().updateSettings(
                      isMusicOn: _music,
                      isSoundOn: _sound,
                      isNotificationOn: _notification,
                      isVibrationOn: _vibration,
                    );
                    debugPrint('Settings saved');
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
