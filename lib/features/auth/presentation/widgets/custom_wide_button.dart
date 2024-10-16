import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/font_manager.dart';

class CustomWideButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const CustomWideButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.semiBold,
          ),
        ),
      ),
    );
  }
}
