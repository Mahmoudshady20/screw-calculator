import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key,required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white12,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          'Go to the scoreboard screen',
          style: TextStyle(color: Colors.white),
        ));
  }
}
