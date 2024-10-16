import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

class CustomWideButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;

  const CustomWideButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s42,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8), // Rounded corners
          ),
        ),
        child: Text(
          buttonText,
          style: StylesManager.semiBold16,
        ),
      ),
    );
  }
}
