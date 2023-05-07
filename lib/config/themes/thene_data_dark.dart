import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_hex_colors.dart';

ThemeData getThemeDataDark() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppHexColors.dark2,
      primaryColor: AppHexColors.darkBlue,
      hintColor: AppHexColors.dark,
      appBarTheme: const AppBarTheme(
        color: AppHexColors.dark2,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(AppColors.white)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(8),
          backgroundColor: MaterialStatePropertyAll(AppHexColors.darkBlue),
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 24,
          color: AppColors.white,
        ),
        bodyMedium: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.white,
          decorationThickness: 1.5,
          decorationStyle: TextDecorationStyle.solid,
        ),
        bodySmall: TextStyle(
          color: AppHexColors.darkBlue,
          fontSize: 16,
        ),
        bodyLarge: TextStyle(
          color: AppColors.white,
          fontSize: 16,
        ),

        titleLarge: TextStyle(
          color: AppColors.white,
          fontSize: 16,
        ),
        labelLarge: TextStyle(
          fontSize: 20,
          color: AppColors.redAccent,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          color: AppColors.redAccent,
        ),
        labelSmall: TextStyle(
          fontSize: 16,
          color: AppColors.grey
        ),
      ),
    );
