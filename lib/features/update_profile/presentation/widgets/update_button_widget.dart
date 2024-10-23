import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/custom_wide_button.dart';
import 'package:tech_tide/features/update_profile/presentation/cubit/update_profile_cubit.dart';

class UpdateButtonWidget extends StatelessWidget {
  const UpdateButtonWidget({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      builder: (context, state) {
        return CustomWideButton(
          buttonText: AppStrings.update.translate,
          onPressed: onPressed,
        );
      },
    );
  }
}
