import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_hex_colors.dart';

ThemeData getThemeDataDark() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppHexColors.dark,
      primaryColor: AppHexColors.dark,
      hintColor: AppHexColors.dark,
      appBarTheme: const AppBarTheme(
        color: AppHexColors.dark,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(AppColors.white)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(8),
           backgroundColor: MaterialStatePropertyAll(AppHexColors.darkBlue),
          // foregroundColor: MaterialStatePropertyAll(AppHexColors.darkBlue),
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.white,
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          color: AppColors.white,
          fontSize: 16,
        ),
        bodyLarge: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          // decoration: TextDecoration.underline,
          // decorationColor: AppHexColors.darkBlue,
          // decorationThickness: 1.5,
          // decorationStyle: TextDecorationStyle.solid,
        ),
        titleLarge: TextStyle(
          color: AppColors.white,
          fontSize: 16,
        ),
        labelLarge: TextStyle(
          fontSize: 20,
          color: Colors.redAccent,
        ),
        labelMedium: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        labelSmall: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    );
