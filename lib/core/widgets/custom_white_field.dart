import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

class CustomWhiteTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? minLines;
  final int? maxLines;
  final double borderRadius;
  final Function(String value)? onSubmit;
  final TextInputAction? textInputAction;
  final Widget? suffix;

  const CustomWhiteTextField({
    super.key,
    required this.hintText,
    this.borderRadius = AppSize.s16,
    this.textInputAction,
    this.minLines,
    this.maxLines,
    this.controller,
    this.validator,
    this.onSubmit,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textInputAction: textInputAction,
      onFieldSubmitted: (value) {
        if (onSubmit != null) {
          onSubmit!(value);
        }
      },
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        suffixIcon: suffix,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: ColorManager.babyBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: ColorManager.babyBlue),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: ColorManager.babyBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: ColorManager.babyBlue),
        ),
        hintText: hintText,
        fillColor: ColorManager.white,
        filled: true,
      ),
    );
  }
}
