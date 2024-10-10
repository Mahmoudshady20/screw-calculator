import 'package:flutter/material.dart';

class SwipeWidget extends StatelessWidget {
  const SwipeWidget({super.key,required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        label,
        style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
    );
  }
}
