import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/features/auth/presentation/widgets/labeled_textfield.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.validator,
  });

  final String label;
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return LabeledTextField(
      label: label,
      hintText: hintText,
      isObscure: true,
      controller: controller,
      validator: validator,
      suffix: const Icon(
        Icons.remove_red_eye_outlined,
        color: ColorManager.gray,
      ),
    );
  }
}
