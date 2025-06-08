import 'package:base_nest/core/constants/app_colors.dart';
import 'package:base_nest/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  fontFamily: 'Poppins',
  appBarTheme: AppBarTheme(
    color: AppColors.surface,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColors.primary),
    titleTextStyle: AppTextStyles.displayMedium,
  ),
  textTheme: TextTheme(
    displayLarge: AppTextStyles.displayLarge,
    displayMedium: AppTextStyles.displayMedium,
    bodyLarge: AppTextStyles.bodyLarge,
    labelLarge: AppTextStyles.labelLarge,
    bodySmall: AppTextStyles.bodySmall,
  ),
);