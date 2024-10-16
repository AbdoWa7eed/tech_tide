import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/custom_wide_button.dart';
import 'package:tech_tide/features/auth/presentation/widgets/already_have_account_button.dart';
import 'package:tech_tide/features/auth/presentation/widgets/auth_welcome_text.dart';
import 'package:tech_tide/features/auth/presentation/widgets/labeled_textfield.dart';
import 'package:tech_tide/features/auth/presentation/widgets/password_form_field.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthWelcomeText(
          text: AppStrings.createAccount.translate,
        ),
        const SizedBox(height: AppSize.s20),
        LabeledTextField(
          label: AppStrings.name.translate,
          hintText: AppStrings.nameHint.translate,
        ),
        const SizedBox(height: AppSize.s16),
        LabeledTextField(
          label: AppStrings.email.translate,
          hintText: AppStrings.emailHint.translate,
        ),
        const SizedBox(height: AppSize.s16),
        PasswordFormField(
          label: AppStrings.password.translate,
          hintText: AppStrings.passwordHint.translate,
        ),
        const SizedBox(height: AppSize.s16),
        PasswordFormField(
          label: AppStrings.confirmPassword.translate,
          hintText: AppStrings.confirmPasswordHint.translate,
        ),
        const SizedBox(height: AppSize.s16),
        CustomWideButton(
          buttonText: AppStrings.signup.translate,
          onPressed: () {
            context.pushReplacement(Routes.homeRoute);
          },
        ),
        const SizedBox(height: AppSize.s12),
        const AlreadyHaveAccountButton(),
      ],
    );
  }
}
