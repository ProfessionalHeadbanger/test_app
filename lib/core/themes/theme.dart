import 'package:flutter/cupertino.dart';
import 'package:test_app/core/themes/colors.dart';

class AppTheme {
  static const cupertinoMainTheme = CupertinoThemeData(
      scaffoldBackgroundColor: AppColors.primaryBackground,
      brightness: Brightness.light,
      textTheme: CupertinoTextThemeData(
        navLargeTitleTextStyle: TextStyle(
            color: AppColors.primaryText,
            fontSize: 24,
            fontWeight: FontWeight.w800,
            fontFamily: 'Manrope'),
        navTitleTextStyle: TextStyle(
            color: AppColors.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope'),
        textStyle: TextStyle(
            color: AppColors.primaryText,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope'),
      ));
}
