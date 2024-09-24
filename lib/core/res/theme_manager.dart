import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/font_manager.dart';

ThemeData get appTheme {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.babyBlue,
    fontFamily: FontConstants.fontFamily,
  );
}
