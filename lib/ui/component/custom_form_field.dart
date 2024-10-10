import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?)?;
class CustomFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final IconButton? suffix;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType textInputType;
  final int lines;
  final MyValidator validator;
  const CustomFormField({super.key, this.label,this.isPassword = false,required this.controller,
    this.suffix,this.textInputType = TextInputType.text,this.lines = 1,required this.validator, this.hint});

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
        hintText: hint,
        hintStyle:const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontSize: 15
        ),
        suffixIcon: suffix,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red,),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFec8b03),),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFec8b03)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}