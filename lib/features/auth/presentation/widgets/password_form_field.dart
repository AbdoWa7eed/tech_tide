import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/features/auth/presentation/widgets/labeled_textfield.dart';

class PasswordFormField extends StatefulWidget {
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
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return LabeledTextField(
      label: widget.label,
      hintText: widget.hintText,
      isObscure: _obscureText,
      controller: widget.controller,
      validator: widget.validator,
      suffix: IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: ColorManager.gray,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
