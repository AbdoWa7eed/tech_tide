import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/custom_snack_bar.dart';
import 'package:tech_tide/features/auth/presentation/cubit/auth_cubit.dart';

class AuthListenerWidget extends StatelessWidget {
  final Widget child;

  const AuthListenerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          CustomSnackBar.error(state.message, context);
        } else if (state is AuthSuccess) {
          context.popAllThenPush(Routes.homeRoute);
        }
      },
      child: child,
    );
  }
}
