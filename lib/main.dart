import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task/app.dart';
import 'package:test_task/navigation/app_router.dart';
import 'package:test_task/utils/user_pref.dart';

Future<void> main() async {
  await platformInit();

  runApp(App());
}

Future<void> platformInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppRouter.init();
  await UserPreferences.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
