import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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

  InterstitialAd? _interstitialAd;

  @override
  void dispose() {
    // TODO: Dispose a BannerAd object
    _interstitialAd?.dispose();

    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createInterstitialAd();
  }
  void _createInterstitialAd() {
    InterstitialAd.load(adUnitId: 'ca-app-pub-7674460303083384/8153545582',
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              _interstitialAd = ad;
            },
            onAdFailedToLoad: (LoadAdError error) {
              _interstitialAd = null;
            }
        ));
  }
  void _showInterstitialAd() {
    if(_interstitialAd!=null){
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as List<String>;
    var provider = Provider.of<ScoreBoardViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF24183e),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            _showInterstitialAd();
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
        backgroundColor: const Color(0xff382c52),
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
                  _showInterstitialAd();
                },
                icon: const Icon(Icons.refresh)),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Text(
              'Swipe to see other results',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
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
                  PlayerComponent(playerName: args[0], values: provider.values1, sum: provider.sum1),
                  Container(
                    height: double.infinity,
                    width: 2,
                    color: const Color(0xFFec8b03),
                  ),
                  PlayerComponent(playerName: args[1], values: provider.values2, sum: provider.sum2),
                  provider.numberOfPlayer == 2 || provider.numberOfPlayer == 3 || provider.numberOfPlayer == 4 || provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? Container(
                    height: double.infinity,
                    width: 2,
                    color: const Color(0xFFec8b03),
                  ) : Container(),
                  provider.numberOfPlayer == 3 || provider.numberOfPlayer == 4 || provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8  ? PlayerComponent(playerName: args[2], values: provider.values3, sum: provider.sum3) : Container(),
                  provider.numberOfPlayer == 3 || provider.numberOfPlayer == 4 || provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ?Container(
                    height: double.infinity,
                    width: 2,
                    color: const Color(0xFFec8b03),
                  ) : Container(),
                  provider.numberOfPlayer == 4 || provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? PlayerComponent(playerName: args[3], values: provider.values4, sum: provider.sum4) : Container(),
                  provider.numberOfPlayer == 4 || provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ?Container(
                    height: double.infinity,
                    width: 2,
                    color: const Color(0xFFec8b03),
                  ) : Container(),
                  provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? PlayerComponent(playerName: args[4], values: provider.values5, sum: provider.sum5) : Container(),
                  provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ?Container(
                    height: double.infinity,
                    width: 2,
                    color: const Color(0xFFec8b03),
                  ) : Container(),
                  provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? PlayerComponent(playerName: args[5], values: provider.values6, sum: provider.sum6) : Container(),
                  provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ?Container(
                    height: double.infinity,
                    width: 2,
                    color: const Color(0xFFec8b03),
                  ) : Container(),
                  provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? PlayerComponent(playerName: args[6], values: provider.values7, sum: provider.sum7) : Container(),
                  provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ?Container(
                    height: double.infinity,
                    width: 2,
                    color: const Color(0xFFec8b03),
                  ) : Container(),
                  provider.numberOfPlayer == 8 ? PlayerComponent(playerName: args[7], values: provider.values8, sum: provider.sum8) : Container(),
                  provider.numberOfPlayer == 8 ? Container(
                    height: double.infinity,
                    width: 2,
                    color: const Color(0xFFec8b03),
                  ) : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

