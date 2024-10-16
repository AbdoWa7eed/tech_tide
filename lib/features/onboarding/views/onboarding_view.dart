import 'package:flutter/material.dart';
import 'package:tech_tide/features/onboarding/widgets/onboarding_view_body.dart';
import 'package:tech_tide/features/onboarding/widgets/onboarding_view_bottom_sheet.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: OnboardingViewBody(),
      bottomSheet: OnboardingViewBottomSheet(),
    );
  }
}
