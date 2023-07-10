import 'package:country_explorer/core/utils/app_hex_colors.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData getThemeDataLight() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppHexColors.darkBlue,
      hintColor: AppColors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: AppHexColors.darkBlue,
        iconSize: 30,
      ),
      tooltipTheme: TooltipThemeData(
        textStyle: TextStyle(
            color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.white,
        elevation: 4,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppHexColors.darkBlue,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(AppColors.black)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(8),
          backgroundColor: MaterialStatePropertyAll(AppHexColors.darkBlue),
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 24, color: AppHexColors.violet),
        bodyMedium: TextStyle(
          color: AppHexColors.darkBlue,
          fontSize: 16,
          decoration: TextDecoration.underline,
          decorationColor: AppHexColors.darkBlue,
          decorationThickness: 1.5,
          decorationStyle: TextDecorationStyle.solid,
        ),
        bodySmall: TextStyle(
          color: AppHexColors.darkBlue,
          fontSize: 16,
        ),
        bodyLarge: TextStyle(
          color: AppHexColors.darkBlue,
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
          color: AppColors.grey,
        ),
        headlineMedium: TextStyle(fontSize: 18, color: AppColors.white),
      ),
    );
