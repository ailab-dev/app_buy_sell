
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:flutter/material.dart';

class AppTheme {
  late ThemeData theme;

  AppTheme() {
    theme = _createTheme();
  }

  ThemeData _createTheme() => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: ColorsConstant.text,
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorsConstant.dark,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorsConstant.dark,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsConstant.purple),
        useMaterial3: true,
      );
}
