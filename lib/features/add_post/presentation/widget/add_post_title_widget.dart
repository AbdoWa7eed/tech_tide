import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/custom_white_field.dart';

class AddPostTitleWidget extends StatelessWidget {
  const AddPostTitleWidget({super.key, this.titleController});

  final TextEditingController? titleController;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        AppStrings.title.translate,
        style: StylesManager.medium18,
      ),
      const SizedBox(height: AppSize.s12),
      CustomWhiteTextField(
          validator: ValidationBuilder(
            requiredMessage: AppStrings.fieldsRequired.translate,
          ).required().build(),
          controller: titleController,
          hintText: AppStrings.addPostTitle.translate)
    ]);
  }
}
