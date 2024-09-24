import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/widgets/fade_transition.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image(
          image: AssetImage(
            AssetsManager.splashImagePath,
          ),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        CustomFadeTransition(
          child: Column(
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
