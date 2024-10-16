import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/font_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

ThemeData get appTheme {
  return ThemeData(
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: ColorManager.babyBlue,
    fontFamily: FontConstants.fontFamily,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorManager.white,
    ),
    primaryColor: ColorManager.primaryWith10Opacity,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primaryWith10Opacity,
      primary: ColorManager.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorManager.primary),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorManager.primary),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorManager.gray),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorManager.error),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorManager.primary),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      hintStyle: StylesManager.regular14.copyWith(
        color: ColorManager.gray,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
