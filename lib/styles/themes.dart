import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/styles/colors.dart';
import 'package:plants_ui_challenge/styles/styles.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: AppColors.grey4,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.primary,
      primary: AppColors.black,
      secondary: AppColors.black,
      tertiary: AppColors.black,
      background: AppColors.primaryBackground,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryBackground,
      foregroundColor: AppColors.black,
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
      elevation: 0.0,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.primaryBackground,
      surfaceTintColor: AppColors.black,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      filled: true,
      fillColor: AppColors.grey2,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white),
        borderRadius: AppStyles.inputRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white),
        borderRadius: AppStyles.inputRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white),
        borderRadius: AppStyles.inputRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white),
        borderRadius: AppStyles.inputRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
        borderRadius: AppStyles.inputRadius,
      ),
      errorStyle: TextStyle(
        color: AppColors.primary,
      ),
      errorMaxLines: 2,
      labelStyle: TextStyle(
        color: AppColors.grey7,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: TextStyle(color: AppColors.grey6),
    ),
  );
}
