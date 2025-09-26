import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/const/icons.dart';
import 'package:test_task/navigation/routes.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/app_header.dart';
import 'package:test_task/widgets/common/button_wrapper.dart';
import 'package:test_task/widgets/common/menu_container.dart';
import 'package:test_task/widgets/common/stroke_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final state = context.read<AppCubit>().state.user;

    _usernameController.text = state.username;
    _emailController.text = state.email;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

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
                      BlocBuilder<AppCubit, AppState>(
                        builder: (context, state) {
                          final avatar = state.user.avatar;

                          return Stack(
                            alignment: Alignment.bottomCenter,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: SizeConfig.h(15),
                                padding: EdgeInsets.all(SizeConfig.h(3)),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(Assets.buttonWrapper),
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    avatar,
                                    fit: BoxFit.contain,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -SizeConfig.h(0.3),
                                child: GestureDetector(
                                  onTap: () =>
                                      context.goNamed(AppRouteNames.avatar),
                                  child: SvgPicture.asset(
                                    AppIcons.edit,
                                    height: SizeConfig.h(3),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: SizeConfig.h(3)),
                      TextField(
                        controller: _usernameController,
                        style: Theme.of(context).textTheme.bodySmall,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Zа-яА-ЯёЁ\s]'),
                          ),
                        ],
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              AppIcons.inputIcon,
                              height: SizeConfig.h(2.5),
                            ),
                          ),
                          hintText: 'username',
                          hintStyle: const TextStyle(color: AppColors.white),
                          filled: true,
                          fillColor: AppColors.pink,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.h(3)),
                      TextField(
                        controller: _emailController,
                        style: Theme.of(context).textTheme.bodySmall,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              AppIcons.inputIcon,
                              height: SizeConfig.h(2.5),
                            ),
                          ),
                          hintText: 'email',
                          hintStyle: const TextStyle(color: AppColors.white),
                          filled: true,
                          fillColor: AppColors.pink,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.h(3)),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.h(1.5)),
                ButtonWrapper(
                  onTap: saveUserInfo,
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

  void saveUserInfo() {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();

    if (username.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username and Email cannot be empty.'),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }

    context.read<AppCubit>().updateUser(username: username, email: email);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data saved successfully'),
        backgroundColor: AppColors.green,
      ),
    );
  }
}
