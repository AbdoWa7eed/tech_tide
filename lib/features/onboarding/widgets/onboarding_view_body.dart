import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        const Image(
          image: AssetImage(
            AssetsManager.splashImagePath,
          ),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Positioned(
          top: height * 0.3,
          left: AppPadding.p20,
          right: AppPadding.p20,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.welcomeMessage,
                textAlign: TextAlign.center,
                style: StylesManager.bold32,
              ),
              Text(
                AppStrings.sloganMessage,
                style: StylesManager.semiBold18,
              ),
            ],
          ),
        )
      ],
    );
  }
}
