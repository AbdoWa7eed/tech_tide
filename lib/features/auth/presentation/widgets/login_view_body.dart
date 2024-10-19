import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tech_tide/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:tech_tide/features/auth/presentation/widgets/auth_welcome_text.dart';
import 'package:tech_tide/features/auth/presentation/widgets/dont_have_account_button.dart';
import 'package:tech_tide/features/auth/presentation/widgets/labeled_textfield.dart';
import 'package:tech_tide/features/auth/presentation/widgets/password_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AuthWelcomeText(
              text: AppStrings.loginTo.translate,
            ),
            const SizedBox(height: AppSize.s20),
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
            const SizedBox(height: AppSize.s40),
            AuthSubmitButton(
              buttonText: AppStrings.login.translate,
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().login(
                        email: _emailController.text.trim(),
                        password: _passwordController.text,
                      );
                }
              },
            ),
            const SizedBox(height: AppSize.s12),
            const DontHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
