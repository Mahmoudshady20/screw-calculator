import 'package:flutter/material.dart';
import 'package:skrocalc/ui/component/custom_form_field.dart';

class NameOfPlayer extends StatelessWidget {
  const NameOfPlayer(
      {super.key, required this.controller, required this.label});
  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomFormField(
          label: label,
          controller: controller,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter your name';
            }
            return null;
          }),
    );
  }
}
