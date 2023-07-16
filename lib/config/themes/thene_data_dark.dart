import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_hex_colors.dart';

ThemeData getThemeDataDark() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.black,
      primaryColor: AppHexColors.dark,
      hintColor: AppColors.black,
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //     backgroundColor: MaterialStatePropertyAll(AppHexColors.indigo2),
      //   ),
      // ),
      // dialogTheme: DialogTheme(
      //   backgroundColor: AppHexColors.dark2,
      // ),
      tooltipTheme: TooltipThemeData(
        textStyle: TextStyle(
            color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: AppColors.white,
        iconSize: 30,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.grey[900],
        elevation: 4,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.black,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(AppColors.white)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(8),
          backgroundColor: MaterialStatePropertyAll(AppHexColors.dark),
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
          color: AppHexColors.dark,
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
        labelSmall: TextStyle(fontSize: 15, color: AppColors.grey),
        headlineMedium: TextStyle(fontSize: 18, color: AppHexColors.dark),
        headlineSmall: TextStyle(fontSize: 18, color: AppColors.white),
      ),
    );
