import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/post_details/presentation/cubit/post_details_cubit.dart';

class AddReplyFormField extends StatefulWidget {
  const AddReplyFormField({super.key});

  @override
  State<AddReplyFormField> createState() => _AddReplyFormFieldState();
}

class _AddReplyFormFieldState extends State<AddReplyFormField> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p18,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  validator: ValidationBuilder(
                          requiredMessage: AppStrings.fieldsRequired.translate)
                      .build(),
                  minLines: 1,
                  maxLines: null,
                  style: StylesManager.regular14,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                    filled: true,
                    fillColor: ColorManager.white,
                    hintText: AppStrings.addReply.translate,
                    hintStyle: StylesManager.regular12,
                  ),
                ),
              ),
              const SizedBox(width: AppSize.s12),
              IconButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<PostDetailsCubit>()
                          .addReply(_controller.text);
                      _controller.clear();
                    }
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppSize.s8),
                      ),
                    ),
                    maximumSize: const Size(AppSize.s40, AppSize.s40),
                  ),
                  icon: BlocBuilder<PostDetailsCubit, PostDetailsState>(
                      builder: (context, state) {
                    if (state is AddReplyLoading) {
                      return const CircularProgressIndicator(
                        color: ColorManager.white,
                      );
                    }
                    return SvgPicture.asset(AssetsManager.sendIcon);
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
