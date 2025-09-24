import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/utils/layout_wrapper.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/app_header.dart';
import 'package:test_task/widgets/common/menu_container.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'terms of use',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Spacer(),
                        Text(
                          'text',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Spacer(),
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
