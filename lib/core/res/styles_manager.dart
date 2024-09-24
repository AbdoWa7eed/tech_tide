import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/font_manager.dart';

abstract class StylesManager {
  static const TextStyle semiBold18 = TextStyle(
    fontSize: FontSize.s18,
    color: ColorManager.white,
    fontWeight: FontWeightManager.semiBold,
  );

  static const TextStyle bold32 = TextStyle(
    fontSize: FontSize.s32,
    color: ColorManager.white,
    fontWeight: FontWeightManager.bold,
  );
}
