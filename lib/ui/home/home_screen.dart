import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:skrocalc/provider/name_model.dart';
import 'package:skrocalc/provider/scoreboard_viewmodel.dart';
import 'package:skrocalc/ui/free/freee.dart';
import 'package:skrocalc/ui/home/widget/enter_name_widget.dart';
import 'package:skrocalc/ui/home/widget/name_of_player.dart';
import 'package:skrocalc/ui/home/widget/navigation_button.dart';
import 'package:skrocalc/ui/home/widget/number_players_widget.dart';
import 'package:skrocalc/ui/home/widget/swipe_widget.dart';
import 'package:skrocalc/ui/score_screen/score_screen.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;
  late TextEditingController controller5;
  late TextEditingController controller6;
  late TextEditingController controller7;
  late TextEditingController controller8;

  var formKey = GlobalKey<FormState>();
  late bool isInterstitialAdLoaded;
  late InterstitialAd _interstitialAd;

  @override
  void dispose() {
    _interstitialAd.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    controller7.dispose();
    controller8.dispose();
    super.dispose();
  }

  @override
  void initState() {
    isInterstitialAdLoaded = false;
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    controller5 = TextEditingController();
    controller6 = TextEditingController();
    controller7 = TextEditingController();
    controller8 = TextEditingController();
    adLoaded();

    super.initState();
  }

  adLoaded() async {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-7674460303083384/8153545582',
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            setState(() {
              _interstitialAd = ad;
              isInterstitialAdLoaded = true;
            });
          },
          onAdFailedToLoad: (error) {
            _interstitialAd.dispose();
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24183e),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff382c52),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Free.routeName);
            },
            icon: const Icon(
              Icons.waving_hand,
              color: Colors.white,
            ),
          )
        ],
        centerTitle: true,
        title: const Text(
          'ف.ـلسطيــن حرة',
          style: TextStyle(color: Colors.white,),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10),
            child: Consumer<ScoreBoardViewModel>(
              builder: (context, value, child) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SwipeWidget(
                    label: 'Swipe to choose number of players',
                  ),
                  const NumberPlayersWidget(),
                  const EnterNameWidget(),
                  Row(
                    children: [
                      NameOfPlayer(
                          controller: controller1, label: 'Player One'),
                      const SizedBox(
                        width: 8,
                      ),
                      NameOfPlayer(
                          controller: controller2, label: 'Player Two'),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      value.numberOfPlayer == 3 ||
                              value.numberOfPlayer == 4 ||
                              value.numberOfPlayer == 5 ||
                              value.numberOfPlayer == 6 ||
                              value.numberOfPlayer == 7 ||
                              value.numberOfPlayer == 8
                          ? NameOfPlayer(
                              controller: controller3, label: 'Player Three')
                          : Container(),
                      const SizedBox(
                        width: 8,
                      ),
                      value.numberOfPlayer == 4 ||
                              value.numberOfPlayer == 5 ||
                              value.numberOfPlayer == 6 ||
                              value.numberOfPlayer == 7 ||
                              value.numberOfPlayer == 8
                          ? NameOfPlayer(
                              controller: controller4, label: 'Player Four')
                          : Container(),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      value.numberOfPlayer == 5 ||
                              value.numberOfPlayer == 6 ||
                              value.numberOfPlayer == 7 ||
                              value.numberOfPlayer == 8
                          ? NameOfPlayer(
                              controller: controller5, label: 'Player Five')
                          : Container(),
                      const SizedBox(
                        width: 8,
                      ),
                      value.numberOfPlayer == 6 ||
                              value.numberOfPlayer == 7 ||
                              value.numberOfPlayer == 8
                          ? NameOfPlayer(
                              controller: controller6, label: 'Player Six')
                          : Container(),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      value.numberOfPlayer == 7 || value.numberOfPlayer == 8
                          ? NameOfPlayer(
                              controller: controller7, label: 'Player Seven')
                          : Container(),
                      const SizedBox(
                        width: 8,
                      ),
                      value.numberOfPlayer == 8
                          ? NameOfPlayer(
                              controller: controller8, label: 'Player Eight')
                          : Container(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  NavigationButton(
                    onPressed: () async {
                      if (isInterstitialAdLoaded == true) {
                        await _interstitialAd.show();
                      }
                      goTo();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void goTo() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    var provider = Provider.of<ScoreBoardViewModel>(context, listen: false);
    provider.clear();
    provider.updateName(NameModel(
        name1: controller1.text,
        name2: controller2.text,
        name3: controller3.text,
        name4: controller4.text,
        name5: controller5.text,
        name6: controller6.text,
        name7: controller7.text,
        name8: controller8.text));
    Navigator.pushNamed(
      context,
      ScoreScreen.routeName,
    );
  }


}
