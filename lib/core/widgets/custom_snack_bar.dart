import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';

abstract class CustomSnackBar {
  static success(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: StylesManager.medium16,
        ),
        backgroundColor: ColorManager.primary,
      ),
    );
  }

  static error(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: StylesManager.medium16,
        ),
        backgroundColor: ColorManager.error,
      ),
    );
  }
}
