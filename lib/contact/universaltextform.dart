import 'package:flutter/material.dart';

class UniversalTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final String? Function(String?)? validator;

  const UniversalTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.inputType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: validator, 
    );
  }
}
