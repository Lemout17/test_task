import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_task/bloc/app/app_cubit.dart';
import 'package:test_task/navigation/app_router.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/utils/theme_notifier.dart';

class App extends StatelessWidget {
  const App({super.key});

  Future<AppCubit> _initCubit() async {
    return await AppCubit.load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppCubit>(
      future: _initCubit(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        final appCubit = snapshot.data!;

        return MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeNotifier())],
          child: BlocProvider<AppCubit>.value(
            value: appCubit,
            child: Builder(
              builder: (context) {
                SizeConfig.init(context);
                final themeNotifier = context.watch<ThemeNotifier>();

                return MaterialApp.router(
                  title: 'Test Task',
                  theme: themeNotifier.currentTheme,
                  routerConfig: AppRouter.router,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
