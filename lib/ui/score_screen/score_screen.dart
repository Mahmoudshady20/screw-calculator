import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrocalc/provider/scoreboard_viewmodel.dart';
import 'package:skrocalc/ui/component/dialog_utils.dart';
import 'package:skrocalc/ui/component/player_component.dart';
import 'package:skrocalc/ui/score_screen/show_bottomsheet.dart';

class ScoreScreen extends StatefulWidget {
  static const String routeName = 'scorescreen';

  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as List<String>;
    var provider = Provider.of<ScoreBoardViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF040C23),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            DialogUtils.showMessage(
                context, 'هل تريد الرجوع الي الخلف',
                posAction: () {
                 Navigator.pop(context);
                },
                postActionName: 'نعم',
                dismissible: false,
                negActionName: 'إلغاء',
                negAction: (){

                }
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(0xFF121931),
        title: const Text('Score Board',
        style: TextStyle(
          fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => AddScoreBottomSheet(names: args),
                  shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )),
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent
                );
              },
              icon: const Icon(Icons.add)),
          Consumer<ScoreBoardViewModel>(
            builder: (context, value, child) => IconButton(
                onPressed: (){
                  DialogUtils.showMessage(
                      context, 'هل تريد اعادة تعيين اللوحة',
                      posAction: () {
                        value.clear();
                      },
                      postActionName: 'نعم',
                      dismissible: false,
                      negActionName: 'إلغاء',
                      negAction: (){

                      }
                  );

                },
                icon: const Icon(Icons.refresh)),
          ),
        ],
      ),
      body: Row(
        children: [
          PlayerComponent(playerName: args[0], values: provider.values1, sum: provider.sum1),
          Container(
            height: double.infinity,
            width: 1,
            color: Colors.white,
          ),
          PlayerComponent(playerName: args[1], values: provider.values2, sum: provider.sum2),
          Container(
            height: double.infinity,
            width: 1,
            color: Colors.white,
          ),
          provider.numberOfPlayer == 3 || provider.numberOfPlayer == 4 ? PlayerComponent(playerName: args[2], values: provider.values3, sum: provider.sum3) : Container(),
          Container(
            height: double.infinity,
            width: 1,
            color: Colors.white,
          ),
          provider.numberOfPlayer == 4 ? PlayerComponent(playerName: args[3], values: provider.values4, sum: provider.sum4) : Container(),
        ],
      ),
    );
  }
}

