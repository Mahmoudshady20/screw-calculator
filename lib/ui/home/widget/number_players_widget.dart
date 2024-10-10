import 'package:flutter/material.dart';
import 'package:skrocalc/ui/home/widget/number_of_player.dart';

class NumberPlayersWidget extends StatelessWidget {
  const NumberPlayersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0x8edc64a0),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NumberOfPlayer(number: 9),
            NumberOfPlayer(number: 2),
            NumberOfPlayer(number: 3),
            NumberOfPlayer(number: 4),
            NumberOfPlayer(number: 5),
            NumberOfPlayer(number: 6),
            NumberOfPlayer(number: 7),
            NumberOfPlayer(number: 8),
          ],
        ),
      ),
    );
  }
}
