import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/add_post/presentation/widget/custom_white_field.dart';
import 'package:tech_tide/features/add_post/presentation/widget/post_attachment_widget.dart';

class ContentInputWidget extends StatelessWidget {
  const ContentInputWidget({super.key, this.contentController});

  final TextEditingController? contentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.content.translate,
          style: StylesManager.medium18,
        ),
        const SizedBox(height: AppSize.s12),
        Card(
          elevation: 0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s16),
          ),
          child: Column(
            children: [
              CustomWhiteTextField(
                controller: contentController,
                validator: ValidationBuilder(
                  requiredMessage: AppStrings.fieldsRequired.translate,
                ).required().build(),
                borderRadius: 0,
                minLines: 5,
                hintText: AppStrings.addContent.translate,
              ),
              const PostAttachmentWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
