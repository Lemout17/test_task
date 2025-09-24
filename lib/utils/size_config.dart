import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;
  static late double textMultiplier;

  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    screenWidth = mediaQuery.width;
    screenHeight = mediaQuery.height;

    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;

    textMultiplier = (screenWidth / 100 + screenHeight / 100) / 2;
  }

  static double w(double percent) => blockWidth * percent;
  static double h(double percent) => blockHeight * percent;
  static double font(double size) => size * textMultiplier;
}
