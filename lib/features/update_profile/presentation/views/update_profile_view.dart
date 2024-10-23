import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/gradiant_app_bar.dart';
import 'package:tech_tide/features/update_profile/presentation/widgets/update_profile_view_body.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: AppStrings.updateProfile.translate),
      body: const UpdateProfileViewBody(),
    );
  }
}
