import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/scoreboard_viewmodel.dart';

class NumberOfPlayer extends StatelessWidget {
  const NumberOfPlayer({super.key,required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreBoardViewModel>(
      builder: (context, value, child) => InkWell(
        onTap: () {
          value.updateNumberOfPlayer(number);
        },
        child: Container(
          decoration: BoxDecoration(
              color: value.numberOfPlayer == number
                  ? Colors.white38
                  : Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: number ==9 ? const Radius.circular(20) : const Radius.circular(0),
                bottomLeft: number ==9 ? const Radius.circular(20) : const Radius.circular(0),
                bottomRight: number ==8 ? const Radius.circular(20) : const Radius.circular(0),
                topRight: number ==8 ? const Radius.circular(20) : const Radius.circular(0),
              )),
          padding: const EdgeInsets.all(10),
          child: Text(
            number == 9 ? 'صاحب صحبو': '$number player',
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
