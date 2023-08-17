import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
    colorScheme: _colorScheme,
    textTheme: _textTheme(_colorScheme),
    // toggleableActiveColor: primaryColor,
    primaryColor: AppColors.primaryColor,
    fontFamily: 'Rogerex',
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: AppColors.whiteColor,
    dialogTheme: _dialogTheme,
    hoverColor: AppColors.whiteColor.withOpacity(0.15),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 1.7,
      toolbarHeight: 90,
    ),
  );

  static const ColorScheme _colorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    background: AppColors.whiteColor,
    brightness: Brightness.light,
    secondary: AppColors.secondaryColor,
    surface: AppColors.whiteColor,
    onBackground: AppColors.whiteColor,
    onError: AppColors.redColor,
    onPrimary: AppColors.primaryColor,
    onSecondary: AppColors.secondaryColor,
    onSurface: AppColors.whiteColor,
    error: AppColors.redColor,
  );

  static TextTheme _textTheme(ColorScheme colorScheme) => const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 50.5,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          fontSize: 42.5,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
        headlineSmall: TextStyle(
          fontSize: 34.5,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor,
        ),
        titleLarge: TextStyle(
          fontSize: 24.5,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor,
        ),
        titleMedium: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 13.5,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          fontSize: 14,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.5,
          color: AppColors.whiteColor,
        ),
        labelLarge: TextStyle(
          fontSize: 18,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
        ),
      );

  static const DialogTheme _dialogTheme = DialogTheme(
    backgroundColor: Colors.black87,
  );
}
