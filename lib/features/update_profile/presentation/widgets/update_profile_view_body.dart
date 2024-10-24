import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/update_profile/presentation/cubit/update_profile_cubit.dart';
import 'package:tech_tide/features/update_profile/presentation/widgets/bio_field_widget.dart';
import 'package:tech_tide/features/update_profile/presentation/widgets/name_input_field.dart';
import 'package:tech_tide/features/update_profile/presentation/widgets/update_button_widget.dart';
import 'package:tech_tide/features/update_profile/presentation/widgets/update_profile_image_widget.dart';

class UpdateProfileViewBody extends StatefulWidget {
  const UpdateProfileViewBody({super.key});

  @override
  State<UpdateProfileViewBody> createState() => _UpdateProfileViewBodyState();
}

class _UpdateProfileViewBodyState extends State<UpdateProfileViewBody> {
  late final TextEditingController _nameController;
  late final TextEditingController _bioController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _nameController = TextEditingController();
    _bioController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
    final cubit = context.read<UpdateProfileCubit>();
    _nameController.text = cubit.user.username;
    _bioController.text = cubit.user.bio;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20,
            vertical: AppPadding.p18,
          ),
          child: Column(
            children: [
              const UpdateProfileImageWidget(),
              const SizedBox(height: AppSize.s20),
              NameInputField(
                nameController: _nameController,
              ),
              const SizedBox(height: AppSize.s20),
              BioInputField(
                nameController: _bioController,
              ),
              const SizedBox(height: AppSize.s40),
              UpdateButtonWidget(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<UpdateProfileCubit>().updateProfile(
                          username: _nameController.text.trim(),
                          bio: _bioController.text.trim(),
                        );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
