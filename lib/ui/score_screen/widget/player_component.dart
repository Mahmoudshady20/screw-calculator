import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrocalc/provider/scoreboard_viewmodel.dart';

class PlayerComponent extends StatelessWidget {
  const PlayerComponent({super.key,required this.playerName,required this.values,required this.sum});
  final String playerName;
  final List<int> values;
  final int sum;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ScoreBoardViewModel>(context);
    return  SizedBox(
      width: provider.numberOfPlayer == 2 || provider.numberOfPlayer == 9 ? MediaQuery.of(context).size.width * .49: provider.numberOfPlayer == 3 ? MediaQuery.of(context).size.width * .33 : MediaQuery.of(context).size.width * .25,
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          Consumer<ScoreBoardViewModel>(
            builder: (context, value, child) => Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: const Color(0xFFec8b03),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF66011c),
                    width: double.infinity,
                    alignment:Alignment.center,
                    child: Text(playerName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold
                      ),),),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: const Color(0xFFec8b03),
                  ),
                  Expanded(
                    child: ListView.separated(
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
                        height: 2,
                        color: const Color(0xFFec8b03),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: const Color(0xFFec8b03),
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
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 2,
            color: const Color(0xFFec8b03),
          ),
        ],
      ),
    );
  }
}
