import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:skrocalc/provider/scoreboard_viewmodel.dart';
import 'package:skrocalc/ui/component/custom_form_field.dart';
import 'package:skrocalc/ui/score_screen/score_screen.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  TextEditingController controller4 = TextEditingController();
  int number = 1;

  var formKey = GlobalKey<FormState>();
  InterstitialAd? _interstitialAd;

  Uri islamiUrl = Uri.parse(
      'https://play.google.com/store/apps/details?id=com.mahmoudshady.islamiApp');
  Uri instaUrl = Uri.parse(
      'https://instagram.com/sheks_app?igshid=OGQ5ZDc2ODk2ZA==');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-7674460303083384/8153545582',
        request: const AdRequest(),
        adLoadCallback:
            InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
        }, onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd = null;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040C23),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .1,
        decoration: const BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                launcher.launchUrl(instaUrl,
                    mode: launcher.LaunchMode.externalApplication);
              },
              child: const Text(
                'تواصل معنا',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            InkWell(
              onTap: () {
                launcher.launchUrl(islamiUrl,
                    mode: launcher.LaunchMode.externalApplication);
              },
              child: const Text(
                'حمل الأن تطبق اسلامي من متجر جوجل بلاي',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121931),
        centerTitle: true,
        title: const Text('ScoreBoard'),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF121931),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<ScoreBoardViewModel>(
                      builder: (context, value, child) => InkWell(
                        onTap: () {
                          value.updateNumberOfPlayer(2);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: value.numberOfPlayer == 2 ?  Colors.blueGrey : Colors.transparent,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            '2 player',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Consumer<ScoreBoardViewModel>(
                      builder: (context, value, child) => InkWell(
                        onTap: () {
                          value.updateNumberOfPlayer(3);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: value.numberOfPlayer == 3 ?  Colors.blueGrey : Colors.transparent,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            '3 player',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Consumer<ScoreBoardViewModel>(
                      builder: (context, value, child) => InkWell(
                        onTap: () {
                          value.updateNumberOfPlayer(4);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: value.numberOfPlayer == 4 ?  Colors.blueGrey : Colors.transparent,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            '4 player',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  'Please enter names',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Consumer<ScoreBoardViewModel>(
                builder: (context, value, child) => CustomFormField(
                    label: 'Player one',
                    controller: controller1,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    }),
              ),
              const SizedBox(
                height: 12,
              ),
              Consumer<ScoreBoardViewModel>(
                builder: (context, value, child) => CustomFormField(
                    label: 'Player two',
                    controller: controller2,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    }),
              ),
              const SizedBox(
                height: 12,
              ),
              Consumer<ScoreBoardViewModel>(
                builder: (context, value, child) => value.numberOfPlayer == 3 ||  value.numberOfPlayer == 4  ? CustomFormField(
                    label: 'Player three',
                    controller: controller3,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    }) : Container(),
              ),
              const SizedBox(
                height: 12,
              ),
              Consumer<ScoreBoardViewModel>(
                builder: (context, value, child) => value.numberOfPlayer == 4 ?  CustomFormField(
                    label: 'Player four',
                    controller: controller4,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    }) : Container(),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF121931),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, elevation: 0),
                    onPressed: () {
                      if(number == 1){
                        _showInterstitialAd();
                      }
                      number++;
                      goTo();
                    },
                    child: const Text('Go to the scoreboard screen')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goTo() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    var provider = Provider.of<ScoreBoardViewModel>(context,listen: false);
    provider.clear();
    Navigator.pushNamed(context, ScoreScreen.routeName, arguments: [
      controller1.text,
      controller2.text,
      controller3.text,
      controller4.text,
    ]);
  }
  void _showInterstitialAd() {
    if (_interstitialAd != null) {
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
}
