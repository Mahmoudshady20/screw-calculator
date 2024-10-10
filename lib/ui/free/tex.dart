import 'package:flutter/material.dart';

class Tex extends StatelessWidget {
  final String tex;
  const Tex({super.key,required this.tex});

  @override
  Widget build(BuildContext context) {
    return Text(tex,
      textAlign: TextAlign.right,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24
      ),
    );
  }
}
