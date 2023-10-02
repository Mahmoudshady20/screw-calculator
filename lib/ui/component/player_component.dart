import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrocalc/provider/scoreboard_viewmodel.dart';

class PlayerComponent extends StatelessWidget {
  PlayerComponent({super.key,required this.playerName,required this.values,required this.sum});
  String playerName;
  List<int> values;
  int sum;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(playerName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold
              ),),),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white,
          ),
          Expanded(
            child: Consumer<ScoreBoardViewModel>(
              builder: (context, provider, child) => ListView.separated(
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(8),
                  color: values[index] == 0 ? Colors.green : Colors.transparent,
                  child: Text(
                    '${values[index]}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                itemCount:values.length,
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Consumer<ScoreBoardViewModel>(
              builder: (context, value, child) => Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.white,
                  ),
                  Text('total = $sum',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
