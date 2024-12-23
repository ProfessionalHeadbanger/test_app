import 'package:flutter/material.dart';
import 'package:test_app/core/themes/constants/colors.dart';
import 'package:test_app/core/themes/styles/color_styles.dart';
import 'package:test_app/core/themes/styles/text_styles.dart';

class AppTheme {
  static final mainTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryBackground,
    extensions: const [
      TextStyles(
        largeTitle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryText,
          fontFamily: 'Manrope',
        ),
        mediumTitle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryText,
          fontFamily: 'Manrope',
        ),
        smallUsername: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppColors.secondaryText,
          fontFamily: 'Manrope',
        ),
        smallLikes: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryText,
          fontFamily: 'Manrope',
        ),
        largeUsername: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryText,
          fontFamily: 'Manrope',
        ),
        mediumLikes: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryText,
          fontFamily: 'Manrope',
        ),
        textButtonStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.secondaryText,
          fontFamily: 'Manrope',
        ),
      ),
      ColorStyles(
        primaryBackground: AppColors.primaryBackground,
        primaryText: AppColors.primaryText,
        secondaryText: AppColors.secondaryText,
        transparent: AppColors.transparent,
      ),
    ],
  );
}
