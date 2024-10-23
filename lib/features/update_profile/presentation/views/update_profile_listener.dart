import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/custom_snack_bar.dart';
import 'package:tech_tide/features/home_layout/presentation/cubit/layout_cubit.dart';
import 'package:tech_tide/features/update_profile/presentation/cubit/update_profile_cubit.dart';

class UpdateProfileListener extends StatelessWidget {
  const UpdateProfileListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          context.read<LayoutCubit>().setUser(state.user);
          log(state.user.username.toString());
          CustomSnackBar.success(
              AppStrings.updateProfileSuccess.translate, context);
          context.pop();
        }
        if (state is UpdateProfileError) {
          CustomSnackBar.error(state.message, context);
        }
      },
      child: child,
    );
  }
}
