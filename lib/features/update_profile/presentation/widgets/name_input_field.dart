import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/custom_white_field.dart';

class NameInputField extends StatelessWidget {
  const NameInputField({super.key, this.nameController});

  final TextEditingController? nameController;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        AppStrings.name.translate,
        style: StylesManager.medium18,
      ),
      const SizedBox(height: AppSize.s12),
      CustomWhiteTextField(
          validator: ValidationBuilder(
            requiredMessage: AppStrings.fieldsRequired.translate,
          )
              .required()
              .minLength(6, AppStrings.mustBeAtLeast6Chars.translate)
              .build(),
          controller: nameController,
          hintText: AppStrings.nameHint.translate)
    ]);
  }
}
