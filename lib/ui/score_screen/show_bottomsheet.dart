import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:skrocalc/provider/scoreboard_viewmodel.dart';
import 'package:skrocalc/ui/component/custom_form_field.dart';

class AddScoreBottomSheet extends StatefulWidget {
  List<String> names;
  AddScoreBottomSheet({super.key, required this.names});
  @override
  State<AddScoreBottomSheet> createState() => _AddScoreBottomSheetState();
}

class _AddScoreBottomSheetState extends State<AddScoreBottomSheet> {
  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  TextEditingController controller4 = TextEditingController();

  TextEditingController controller5 = TextEditingController();

  TextEditingController controller6 = TextEditingController();

  TextEditingController controller7 = TextEditingController();

  TextEditingController controller8 = TextEditingController();

  var formKey = GlobalKey<FormState>();
  InterstitialAd? _interstitialAd;


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
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ScoreBoardViewModel>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Color(0xFF121931),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        )
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              CustomFormField(
                  textInputType: TextInputType.number,
                  label: widget.names[0],
                  controller: controller1,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {

                      controller1.text = '0';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 12,
              ),
              CustomFormField(
                  textInputType: TextInputType.number,
                  label: widget.names[1],
                  controller: controller2,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your score';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 12,
              ),
              provider.numberOfPlayer == 3 || provider.numberOfPlayer == 4 || provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? CustomFormField(
                  textInputType: TextInputType.number,
                  label: widget.names[2],
                  controller: controller3,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your score';
                    }
                    return null;
                  }) : Container(),
              const SizedBox(
                height: 12,
              ),
              provider.numberOfPlayer == 4 || provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? CustomFormField(
                  textInputType: TextInputType.number,
                  label: widget.names[3],
                  controller: controller4,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your score';
                    }
                    return null;
                  }) : Container(),
              const SizedBox(
                height: 12,
              ),
              provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? CustomFormField(
                  textInputType: TextInputType.number,
                  label: widget.names[4],
                  controller: controller5,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your score';
                    }
                    return null;
                  }) : Container(),
              const SizedBox(
                height: 12,
              ),
              provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? CustomFormField(
                  textInputType: TextInputType.number,
                  label: widget.names[5],
                  controller: controller6,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your score';
                    }
                    return null;
                  }) : Container(),
              const SizedBox(
                height: 12,
              ),
              provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? CustomFormField(
                  textInputType: TextInputType.number,
                  label: widget.names[6],
                  controller: controller7,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your score';
                    }
                    return null;
                  }) : Container(),
              const SizedBox(
                height: 12,
              ),
              provider.numberOfPlayer == 8 ? CustomFormField(
                  textInputType: TextInputType.number,
                  label: widget.names[7],
                  controller: controller8,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your score';
                    }
                    return null;
                  }) : Container(),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    add();
                  },
                  child: const Text('Add'))
            ],
          ),
        ),
      ),
    );
  }

  void add() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    var scoreProvider =
        Provider.of<ScoreBoardViewModel>(context, listen: false);
    if(scoreProvider.numberOfPlayer == 2){
      scoreProvider.addValueInList2Player(
        controller1.text,
        controller2.text,
      );
    }
    else if(scoreProvider.numberOfPlayer == 3){
      scoreProvider.addValueInList3Player(
        controller1.text,
        controller2.text,
        controller3.text,
      );
    }
    else if(scoreProvider.numberOfPlayer == 4){
      scoreProvider.addValueInList4Player(
        controller1.text,
        controller2.text,
        controller3.text,
        controller4.text,
      );
    }
    else if(scoreProvider.numberOfPlayer == 5){
      scoreProvider.addValueInList5Player(
        controller1.text,
        controller2.text,
        controller3.text,
        controller4.text,
        controller5.text,
      );
    }
    else if(scoreProvider.numberOfPlayer == 6){
      scoreProvider.addValueInList6Player(
        controller1.text,
        controller2.text,
        controller3.text,
        controller4.text,
        controller5.text,
        controller6.text,
      );
    }
    else if(scoreProvider.numberOfPlayer == 7){
      scoreProvider.addValueInList7Player(
        controller1.text,
        controller2.text,
        controller3.text,
        controller4.text,
        controller5.text,
        controller6.text,
        controller7.text,
      );
    }
    else if(scoreProvider.numberOfPlayer == 8){
      scoreProvider.addValueInList8Player(
        controller1.text,
        controller2.text,
        controller3.text,
        controller4.text,
        controller5.text,
        controller6.text,
        controller7.text,
        controller8.text,
      );
    }
    _showInterstitialAd();
    Navigator.pop(context);
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

}
