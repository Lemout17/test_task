import 'package:flutter/material.dart';
import 'package:test_task/theme/app_branding_colors.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/size_config.dart';

class AppTheme {
  static const String fontFamily = 'RubikMonoOne';

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: fontFamily,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.cornflowerBlue),
      primaryColor: AppColors.cornflowerBlue,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
      iconTheme: const IconThemeData(color: AppColors.black),
      dividerColor: AppColors.silver.withOpacity(0.2),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.pink,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent, width: 2),
        ),
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: SizeConfig.font(2),
          color: AppColors.white,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
          decorationThickness: 0,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(4),
          vertical: SizeConfig.h(2),
        ),
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontSize: SizeConfig.font(2),
          color: AppColors.white,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          fontSize: SizeConfig.font(4.5),
          color: AppColors.white,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          fontSize: SizeConfig.font(10),
          fontWeight: FontWeight.w400,
          color: AppColors.white,
          fontFamily: fontFamily,
        ),
        bodySmall: TextStyle(
          fontSize: SizeConfig.font(2.5),
          color: AppColors.white,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.cornflowerBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(color: AppColors.white),
          ),
        ),
      ),
      useMaterial3: true,
    ).copyWith(
      extensions: <ThemeExtension<dynamic>>[
        const AppBrandingColors(color: AppColors.cornflowerBlue),
      ],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.silver,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.cornflowerBlue),
      primaryColor: AppColors.cornflowerBlue,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.silver),
      iconTheme: const IconThemeData(color: AppColors.white),
      dividerColor: AppColors.silver.withOpacity(0.2),
      // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //   backgroundColor: AppColors.silver,
      //   selectedItemColor: AppColors.cornflowerBlue,
      //   unselectedItemColor: AppColors.white,
      //   unselectedIconTheme: IconThemeData(color: AppColors.white),
      //   unselectedLabelStyle: TextStyle(color: AppColors.white),
      // ),
      // inputDecorationTheme: const InputDecorationTheme(
      //   border: InputBorder.none,
      //   focusedBorder: InputBorder.none,
      //   enabledBorder: InputBorder.none,
      //   disabledBorder: InputBorder.none,
      //   errorBorder: InputBorder.none,
      //   focusedErrorBorder: InputBorder.none,
      // ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(fontSize: 14, color: AppColors.white),
        headlineMedium: TextStyle(fontSize: 16, color: AppColors.white),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: AppColors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.cornflowerBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(color: AppColors.white),
          ),
        ),
      ),
      useMaterial3: true,
    ).copyWith(
      extensions: <ThemeExtension<dynamic>>[
        const AppBrandingColors(color: AppColors.cornflowerBlue),
      ],
    );
  }
}
