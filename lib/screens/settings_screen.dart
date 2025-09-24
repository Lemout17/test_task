import 'package:flutter/material.dart';
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
  bool music = false;
  bool sound = false;
  bool notification = false;
  bool vibration = false;

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
                          title: 'music',
                          value: music,
                          onChanged: (val) => setState(() => music = val),
                        ),
                        _buildSwitchRow(
                          title: 'sound',
                          value: sound,
                          onChanged: (val) => setState(() => sound = val),
                        ),
                        _buildSwitchRow(
                          title: 'notification',
                          value: notification,
                          onChanged: (val) =>
                              setState(() => notification = val),
                        ),
                        _buildSwitchRow(
                          title: 'vibration',
                          value: vibration,
                          onChanged: (val) => setState(() => vibration = val),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                ButtonWrapper(
                  onTap: () {
                    debugPrint('music: $music');
                    debugPrint('sound: $sound');
                    debugPrint('notification: $notification');
                    debugPrint('vibration: $vibration');
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
