import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?)?;
class CustomFormField extends StatelessWidget {
  String label;
  IconButton? suffix;
  bool isPassword;
  TextEditingController controller;
  TextInputType textInputType;
  int lines;
  MyValidator validator;
  CustomFormField({super.key, required this.label,this.isPassword = false,required this.controller,
    this.suffix,this.textInputType = TextInputType.text,this.lines = 1,required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      keyboardType: textInputType,
      minLines: lines,
      maxLines: lines,
      validator: validator,
      style: const TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        labelStyle:const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontSize: 15
        ),
        labelText: label,
        suffixIcon: suffix,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.cyan,),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.cyan),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}