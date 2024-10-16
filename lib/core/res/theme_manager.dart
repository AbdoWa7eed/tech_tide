import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/font_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

ThemeData get appTheme {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.babyBlue,
    fontFamily: FontConstants.fontFamily,
    colorSchemeSeed: ColorManager.primary,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorManager.white,
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
  );
}
