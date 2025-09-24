import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:test_task/app.dart';

Future<void> main() async {
  await platformInit();

  runApp(const App());
}

Future<void> platformInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Future.wait([
    EasyLocalization.ensureInitialized(),
    // Hive.initFlutter(),
  ]);
}
