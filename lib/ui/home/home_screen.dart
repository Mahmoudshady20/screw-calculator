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
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();
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
  void dispose() {
    // TODO: Dispose a BannerAd object
    _interstitialAd?.dispose();

    super.dispose();
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'Swip to select number of players',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF121931),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
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
                        Consumer<ScoreBoardViewModel>(
                          builder: (context, value, child) => InkWell(
                            onTap: () {
                              value.updateNumberOfPlayer(5);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: value.numberOfPlayer == 5 ?  Colors.blueGrey : Colors.transparent,
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                '5 player',
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
                              value.updateNumberOfPlayer(6);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: value.numberOfPlayer == 6 ?  Colors.blueGrey : Colors.transparent,
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                '6 player',
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
                              value.updateNumberOfPlayer(7);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: value.numberOfPlayer == 7 ?  Colors.blueGrey : Colors.transparent,
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                '7 player',
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
                              value.updateNumberOfPlayer(8);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: value.numberOfPlayer == 8 ?  Colors.blueGrey : Colors.transparent,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                '8 player',
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
                  builder: (context, value, child) => value.numberOfPlayer == 3 ||  value.numberOfPlayer == 4 ||  value.numberOfPlayer == 5 ||  value.numberOfPlayer == 6 ||  value.numberOfPlayer == 7 ||  value.numberOfPlayer == 8  ? CustomFormField(
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
                  builder: (context, value, child) => value.numberOfPlayer == 4 ||  value.numberOfPlayer == 5 ||  value.numberOfPlayer == 6 ||  value.numberOfPlayer == 7 ||  value.numberOfPlayer == 8 ?  CustomFormField(
                      label: 'Player four',
                      controller: controller4,
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
                  builder: (context, value, child) => value.numberOfPlayer == 5 ||  value.numberOfPlayer == 6 ||  value.numberOfPlayer == 7 ||  value.numberOfPlayer == 8   ?  CustomFormField(
                      label: 'Player Five',
                      controller: controller5,
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
                  builder: (context, value, child) =>  value.numberOfPlayer == 6 ||  value.numberOfPlayer == 7 ||  value.numberOfPlayer == 8 ?  CustomFormField(
                      label: 'Player Six',
                      controller: controller6,
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
                  builder: (context, value, child) => value.numberOfPlayer == 7 ||  value.numberOfPlayer == 8 ?  CustomFormField(
                      label: 'Player Seven',
                      controller: controller7,
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
                  builder: (context, value, child) => value.numberOfPlayer == 8 ?  CustomFormField(
                      label: 'Player Eight',
                      controller: controller8,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      }) : Container(),
                ),
                const SizedBox(
                  height: 20,
                ),
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
      ),
    );
  }

  void goTo() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    var provider = Provider.of<ScoreBoardViewModel>(context,listen: false);
    provider.clear();
    if(provider.numberOfPlayer == 2){
      provider.names.add(controller1.text);
      provider.names.add(controller2.text);
    }
    if(provider.numberOfPlayer == 3){
      provider.names.add(controller1.text);
      provider.names.add(controller2.text);
      provider.names.add(controller3.text);
    }
    if(provider.numberOfPlayer == 4){
      provider.names.add(controller1.text);
      provider.names.add(controller2.text);
      provider.names.add(controller3.text);
      provider.names.add(controller4.text);
    }
    if(provider.numberOfPlayer == 5){
      provider.names.add(controller1.text);
      provider.names.add(controller2.text);
      provider.names.add(controller3.text);
      provider.names.add(controller4.text);
      provider.names.add(controller5.text);
    }
    if(provider.numberOfPlayer == 6){
      provider.names.add(controller1.text);
      provider.names.add(controller2.text);
      provider.names.add(controller3.text);
      provider.names.add(controller4.text);
      provider.names.add(controller5.text);
      provider.names.add(controller6.text);
    }
    if(provider.numberOfPlayer == 7){
      provider.names.add(controller1.text);
      provider.names.add(controller2.text);
      provider.names.add(controller3.text);
      provider.names.add(controller4.text);
      provider.names.add(controller5.text);
      provider.names.add(controller6.text);
      provider.names.add(controller7.text);
    }
    if(provider.numberOfPlayer == 7){
      provider.names.add(controller1.text);
      provider.names.add(controller2.text);
      provider.names.add(controller3.text);
      provider.names.add(controller4.text);
      provider.names.add(controller5.text);
      provider.names.add(controller6.text);
      provider.names.add(controller7.text);
      provider.names.add(controller8.text);
    }
    Navigator.pushNamed(context, ScoreScreen.routeName, arguments: [
      controller1.text,
      controller2.text,
      controller3.text,
      controller4.text,
      controller5.text,
      controller6.text,
      controller7.text,
      controller8.text,
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
