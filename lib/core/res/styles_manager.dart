import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/font_manager.dart';

abstract class StylesManager {
  static const TextStyle regular12 = TextStyle(
    fontSize: FontSize.s12,
    color: ColorManager.gray,
    fontWeight: FontWeightManager.regular,
  );

  static const TextStyle regular14 = TextStyle(
    fontSize: FontSize.s14,
    color: ColorManager.black,
    fontWeight: FontWeightManager.regular,
  );

  static const TextStyle regular16 = TextStyle(
    fontSize: FontSize.s16,
    color: ColorManager.black,
    fontWeight: FontWeightManager.regular,
  );

  static const TextStyle medium14 = TextStyle(
    fontSize: FontSize.s14,
    color: ColorManager.black,
    fontWeight: FontWeightManager.medium,
  );

  static const TextStyle medium16 = TextStyle(
    fontSize: FontSize.s16,
    color: ColorManager.white,
    fontWeight: FontWeightManager.medium,
  );

  static const TextStyle medium16Gray = TextStyle(
    fontSize: FontSize.s16,
    color: ColorManager.gray,
    fontWeight: FontWeightManager.regular,
  );
  static const TextStyle medium18 = TextStyle(
    fontSize: FontSize.s18,
    color: ColorManager.deepTeal,
    fontWeight: FontWeightManager.medium,
  );

  static const TextStyle medium18Black = TextStyle(
    fontSize: FontSize.s18,
    color: ColorManager.black,
    fontWeight: FontWeightManager.medium,
  );

  static const TextStyle medium22 = TextStyle(
    fontSize: FontSize.s22,
    color: ColorManager.black,
    fontWeight: FontWeightManager.medium,
  );
  static const TextStyle semiBold16 = TextStyle(
    fontSize: FontSize.s18,
    color: ColorManager.white,
    fontWeight: FontWeightManager.semiBold,
  );

  static const TextStyle semiBold18 = TextStyle(
    fontSize: FontSize.s18,
    color: ColorManager.white,
    fontWeight: FontWeightManager.semiBold,
  );

  static const TextStyle semiBold18Black = TextStyle(
    fontSize: FontSize.s18,
    color: ColorManager.black,
    fontWeight: FontWeightManager.semiBold,
  );

  static const TextStyle semiBold18Blue = TextStyle(
    fontSize: FontSize.s18,
    color: ColorManager.primary,
    fontWeight: FontWeightManager.semiBold,
  );

  static const TextStyle semiBold30 = TextStyle(
    fontSize: FontSize.s30,
    color: ColorManager.white,
    fontWeight: FontWeightManager.semiBold,
  );

  static const TextStyle bold18 = TextStyle(
    fontSize: FontSize.s18,
    color: ColorManager.white,
    fontWeight: FontWeightManager.bold,
  );

  static const TextStyle bold32 = TextStyle(
    fontSize: FontSize.s32,
    color: ColorManager.white,
    fontWeight: FontWeightManager.bold,
  );
}
