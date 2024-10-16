import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';

class AuthWelcomeText extends StatelessWidget {
  const AuthWelcomeText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: StylesManager.semiBold18.copyWith(
            color: ColorManager.black,
          ),
        ),
        const Text(
          AppStrings.appTitle,
          style: StylesManager.semiBold18Blue,
        ),
      ],
    );
  }
}
