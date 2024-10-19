import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/custom_wide_button.dart';

class OnboardingViewBottomSheet extends StatelessWidget {
  const OnboardingViewBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.onboardingTitle.translate,
            textAlign: TextAlign.center,
            style: StylesManager.semiBold18Blue,
          ),
          const SizedBox(height: AppSize.s20),
          Text(
            AppStrings.onboardingSubTitle.translate,
            textAlign: TextAlign.center,
            style: StylesManager.regular14,
          ),
          const SizedBox(height: AppSize.s20),
          CustomWideButton(
            buttonText: AppStrings.getStarted.translate,
            onPressed: () {
              context.pushReplacement(Routes.loginRoute);
            },
          ),
        ],
      ),
    );
  }
}
