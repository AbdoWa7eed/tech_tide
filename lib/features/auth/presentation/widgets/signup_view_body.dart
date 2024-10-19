import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
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

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AuthWelcomeText(
              text: AppStrings.createAccount.translate,
            ),
            const SizedBox(height: AppSize.s20),
            LabeledTextField(
              label: AppStrings.name.translate,
              hintText: AppStrings.nameHint.translate,
              controller: _nameController,
              validator: ValidationBuilder()
                  .minLength(6, AppStrings.mustBeAtLeast6Chars.translate)
                  .required(AppStrings.fieldsRequired.translate)
                  .build(),
            ),
            const SizedBox(height: AppSize.s16),
            LabeledTextField(
              label: AppStrings.email.translate,
              hintText: AppStrings.emailHint.translate,
              controller: _emailController,
              validator: ValidationBuilder(
                      requiredMessage: AppStrings.fieldsRequired.translate)
                  .email(AppStrings.invalidEmailInput.translate)
                  .build(),
            ),
            const SizedBox(height: AppSize.s16),
            PasswordFormField(
              label: AppStrings.password.translate,
              hintText: AppStrings.passwordHint.translate,
              controller: _passwordController,
              validator: ValidationBuilder(
                      requiredMessage: AppStrings.fieldsRequired.translate)
                  .minLength(6, AppStrings.mustBeAtLeast6Chars.translate)
                  .build(),
            ),
            const SizedBox(height: AppSize.s16),
            PasswordFormField(
                label: AppStrings.confirmPassword.translate,
                hintText: AppStrings.confirmPasswordHint.translate,
                controller: _confirmPasswordController,
                validator: ValidationBuilder(
                        requiredMessage: AppStrings.fieldsRequired.translate)
                    .add(_confirmPasswordValidator)
                    .build()),
            const SizedBox(height: AppSize.s40),
            CustomWideButton(
              buttonText: AppStrings.signup.translate,
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  context.pushReplacement(Routes.homeRoute);
                }
              },
            ),
            const SizedBox(height: AppSize.s12),
            const AlreadyHaveAccountButton(),
          ],
        ),
      ),
    );
  }

  StringValidationCallback get _confirmPasswordValidator {
    return (value) {
      if (value != _passwordController.text) {
        return AppStrings.passwordDontMatch.translate;
      }
      return null;
    };
  }
}
