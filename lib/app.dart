import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/screens/loading_screen.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/utils/theme_notifier.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        BlocProvider<AppCubit>(create: (context) => AppCubit()),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return Builder(
            builder: (context) {
              return MaterialApp(
                title: 'Test Task',
                theme: themeNotifier.currentTheme,
                home: const LoadingScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
