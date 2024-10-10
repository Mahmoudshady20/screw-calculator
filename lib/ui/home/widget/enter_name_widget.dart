import 'package:flutter/material.dart';

class EnterNameWidget extends StatelessWidget {
  const EnterNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: const Text(
          'Please enter names',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
    );
  }
}
