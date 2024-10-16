import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isObscure;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Widget? suffix;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isObscure = false,
    this.controller,
    this.validator,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: StylesManager.regular14.copyWith(
              color: ColorManager.black,
            )),
        const SizedBox(height: AppSize.s4),
        SizedBox(
          height: AppSize.s50,
          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText: isObscure,
            style: StylesManager.regular16,
            decoration: InputDecoration(
              suffixIcon: suffix,
              hintText: hintText,
            ),
          ),
        )
      ],
    );
  }
}
