import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/core/utils/app_preferences.dart';
import 'package:tech_tide/core/widgets/fade_transition.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const Image(
          image: AssetImage(
            AssetsManager.splashImagePath,
          ),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        CustomFadeTransition(
          onDone: () => _goNext(context),
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

  void _goNext(BuildContext context) {
    final auth = ServiceLocator.get<FirebaseAuth>();
    if (auth.currentUser != null) {
      return context.pushReplacement(Routes.homeRoute);
    } else {
      final appPreferences = ServiceLocator.get<AppPreferences>();

      if (!appPreferences.isOnBoardingViewed) {
        return context.pushReplacement(Routes.onboardingRoute);
      }
      return context.pushReplacement(Routes.homeRoute);
    }
  }
}
