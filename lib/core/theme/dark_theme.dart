import 'package:base_nest/core/constants/app_colors.dart';
import 'package:base_nest/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: Colors.black,
  fontFamily: 'Poppins',
  appBarTheme: AppBarTheme(
    color: Colors.grey[900],
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
