import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/features/auth/presentation/widgets/labeled_textfield.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.label,
    required this.hintText,
  });

  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return LabeledTextField(
      label: label,
      hintText: hintText,
      isObscure: true,
      suffix: const Icon(
        Icons.remove_red_eye_outlined,
        color: ColorManager.gray,
      ),
    );
  }
}
