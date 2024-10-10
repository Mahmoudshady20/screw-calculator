import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:skrocalc/provider/name_model.dart';
import 'package:skrocalc/ui/home/widget/swipe_widget.dart';
import 'package:provider/provider.dart';
import 'package:skrocalc/provider/scoreboard_viewmodel.dart';
import 'package:skrocalc/ui/component/dialog_utils.dart';
import 'package:skrocalc/ui/score_screen/widget/player_component.dart';
import 'package:skrocalc/ui/show_bottom_sheet/show_bottomsheet.dart';

class ScoreScreen extends StatefulWidget {
  static const String routeName = 'scoreScreen';

  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  late bool isInterstitialAdLoaded;
  late InterstitialAd _interstitialAd;

  @override
  void dispose() {
    _interstitialAd.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isInterstitialAdLoaded = false;
    adLoaded();
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
    var provider = Provider.of<ScoreBoardViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF24183e),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            if (isInterstitialAdLoaded == true) {
              await _interstitialAd.show();
            }
          },
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
        ),
        backgroundColor: const Color(0xff382c52),
        title: const Text(
          'ف.ـلسطيــن حرة',
          style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => AddScoreBottomSheet(
                          names: provider.nameModel ?? NameModel(name1: 'name1', name2: 'name2'),
                        ),
                    shape: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )),
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent);
              },
              icon: const Icon(Icons.add,color: Colors.white,)),
          Consumer<ScoreBoardViewModel>(
            builder: (context, value, child) => IconButton(
                onPressed: () async {
                  DialogUtils.showMessage(context, 'هل تريد اعادة تعيين اللوحة',
                      posAction: () {
                    value.clear();
                  },
                      postActionName: 'نعم',
                      dismissible: false,
                      negActionName: 'إلغاء',
                      negAction: () {});
                  if (isInterstitialAdLoaded == true) {
                    await _interstitialAd.show();
                  }
                },
                icon: const Icon(Icons.refresh,color: Colors.white,)),
          ),
        ],
      ),
      body: Column(
        children: [
          const SwipeWidget(label: 'Swipe to see other results',),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 2,
                    color: const Color(0xFFec8b03),
                  ),
                  PlayerComponent(
                      playerName: provider.nameModel?.name1 ?? '',
                      values: provider.numberOfPlayer == 9 ? provider.valuesSahebSahbo1 : provider.values1,
                      sum: provider.numberOfPlayer == 9 ? provider.sumSahebSahbo1 : provider.sum1),
                  PlayerComponent(
                      playerName: provider.nameModel?.name2 ?? '',
                      values: provider.numberOfPlayer == 9 ? provider.valuesSahebSahbo2 : provider.values2,
                      sum:  provider.numberOfPlayer == 9 ? provider.sumSahebSahbo2 :  provider.sum2),
                  provider.numberOfPlayer >= 3 && provider.numberOfPlayer <= 8 ? PlayerComponent(
                          playerName:  provider.nameModel?.name3 ?? '',
                          values: provider.values3,
                          sum: provider.sum3) : Container(),
                  provider.numberOfPlayer >= 4 && provider.numberOfPlayer <= 8
                      ? PlayerComponent(
                          playerName:  provider.nameModel?.name4 ?? '',
                          values: provider.values4,
                          sum: provider.sum4)
                      : Container(),
                  provider.numberOfPlayer >= 5 && provider.numberOfPlayer <= 8
                      ? PlayerComponent(
                          playerName:  provider.nameModel?.name5 ?? '',
                          values: provider.values5,
                          sum: provider.sum5)
                      : Container(),
                  provider.numberOfPlayer >= 6 && provider.numberOfPlayer <= 8
                      ? PlayerComponent(
                          playerName:  provider.nameModel?.name6 ?? '',
                          values: provider.values6,
                          sum: provider.sum6)
                      : Container(),
                  provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8
                      ? PlayerComponent(
                          playerName:  provider.nameModel?.name7 ?? '',
                          values: provider.values7,
                          sum: provider.sum7)
                      : Container(),
                  provider.numberOfPlayer == 8
                      ? PlayerComponent(
                          playerName:  provider.nameModel?.name8 ?? '',
                          values: provider.values8,
                          sum: provider.sum8)
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
