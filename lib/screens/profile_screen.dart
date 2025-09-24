import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/const/icons.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/app_header.dart';
import 'package:test_task/widgets/common/button_wrapper.dart';
import 'package:test_task/widgets/common/menu_container.dart';
import 'package:test_task/widgets/common/stroke_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      backgroundUrl: Assets.mainBg,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(7)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.h(3)),
                const AppHeader(withCoin: false),
                SizedBox(height: SizeConfig.h(5)),
                MenuContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.h(3)),
                      Text(
                        'profile',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: SizeConfig.h(1.5)),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            Assets.buttonWrapper,
                            height: SizeConfig.h(15),
                          ),
                          Positioned(
                            bottom: -SizeConfig.h(0.3),
                            child: SvgPicture.asset(
                              AppIcons.edit,
                              height: SizeConfig.h(3),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.h(3)),
                      _buildInputField(
                        hint: 'username',
                        icon: AppIcons.inputIcon,
                      ),
                      SizedBox(height: SizeConfig.h(3)),
                      _buildInputField(hint: 'email', icon: AppIcons.inputIcon),
                      SizedBox(height: SizeConfig.h(3)),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.h(1.5)),
                ButtonWrapper(
                  onTap: () {},
                  height: SizeConfig.h(15),
                  child: StrokeText('save', size: SizeConfig.font(8)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({required String hint, required String icon}) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(icon),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.white),
        filled: true,
        fillColor: AppColors.pink,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
