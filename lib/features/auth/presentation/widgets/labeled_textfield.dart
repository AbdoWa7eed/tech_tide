import 'package:flutter/material.dart';
import '../../../../core/res/font_manager.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isObscure;
  final String? Function(String?)? validatorFun;
  final TextEditingController? controller;
  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.isObscure,
    required this.validatorFun,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: FontConstants.fontFamily,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          validator: validatorFun,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeightManager.regular,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
        ),
      ],
    );
  }
}
