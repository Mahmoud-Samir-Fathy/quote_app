import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme(){
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    fontFamily: AppStrings.fontFamily,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        height: 1.3,
        fontSize: 22,
        fontWeight: FontWeight.w800,
      )

    ),
      appBarTheme: AppBarTheme(
        toolbarTextStyle:TextStyle(color:  AppColors.primary),
        color: AppColors.appBarColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 25)

      )
  );
}