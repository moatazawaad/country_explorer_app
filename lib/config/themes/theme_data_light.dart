import 'package:country_explorer/core/utils/app_hex_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_colors.dart';

ThemeData getThemeDataLight() => ThemeData(
  useMaterial3: true,
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppHexColors.darkBlue,
      hintColor: Colors.grey,
      appBarTheme: const AppBarTheme(
        // color: AppColors.white,
        elevation: 0,
        centerTitle: true,
        // systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: TextStyle(
          color: AppHexColors.darkBlue,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(8),
          // backgroundColor: MaterialStatePropertyAll(Colors.white),
          // foregroundColor: MaterialStatePropertyAll(AppHexColors.darkBlue),
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.white,
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          color: AppHexColors.darkBlue,
          fontSize: 16,
        ),
        bodyLarge: TextStyle(
          color: AppHexColors.darkBlue,
          fontSize: 16,
          // decoration: TextDecoration.underline,
          // decorationColor: AppHexColors.darkBlue,
          // decorationThickness: 1.5,
          // decorationStyle: TextDecorationStyle.solid,
        ),
        titleLarge: TextStyle(
          color: AppHexColors.darkBlue,
          fontSize: 16,
        ),
      labelLarge: TextStyle(
        fontSize: 20, color: Colors.redAccent,
      ),
        labelMedium: TextStyle(fontSize: 18, color: Colors.black,),
        labelSmall: TextStyle(fontSize: 18, color: Colors.grey,),
      ),
    );