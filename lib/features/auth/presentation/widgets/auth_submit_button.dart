import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/widgets/custom_wide_button.dart';
import 'package:tech_tide/features/auth/presentation/cubit/auth_cubit.dart';

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({super.key, this.onPressed, required this.buttonText});
  final Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomWideButton(
          buttonText: buttonText,
          onPressed: onPressed,
        );
      },
    );
  }
}
