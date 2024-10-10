import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:skrocalc/provider/name_model.dart';
import 'package:provider/provider.dart';
import 'package:skrocalc/provider/scoreboard_viewmodel.dart';
import 'package:skrocalc/ui/component/custom_form_field.dart';

class AddScoreBottomSheet extends StatefulWidget {
  const AddScoreBottomSheet({super.key,required this.names});
  final NameModel names;
  @override
  State<AddScoreBottomSheet> createState() => _AddScoreBottomSheetState();
}

class _AddScoreBottomSheetState extends State<AddScoreBottomSheet> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomFormField(
                        textInputType: TextInputType.number,
                        label:  provider.numberOfPlayer == 9 ? 'اللاعب الاول التيم الاول' :   widget.names.name1,
                        controller: controller1,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            controller1.text = '0';
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomFormField(
                        textInputType: TextInputType.number,
                        label:   provider.numberOfPlayer == 9 ? 'اللاعب الثاني التيم الاول' :   widget.names.name2,
                        controller: controller2,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            controller2.text = '0';
                          }
                          return null;
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  provider.numberOfPlayer == 3 || provider.numberOfPlayer == 4 || provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 || provider.numberOfPlayer == 9 ? Expanded(
                    child: CustomFormField(
                        textInputType: TextInputType.number,
                        label: provider.numberOfPlayer == 9 ? 'اللاعب الاول التيم الثاني' :  widget.names.name3,
                        controller: controller3,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            controller3.text = '0';
                          }
                          return null;
                        }),
                  ) : Container(),
                  const SizedBox(
                    width: 8,
                  ),
                  provider.numberOfPlayer == 4 || provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 || provider.numberOfPlayer == 9? Expanded(
                    child: CustomFormField(
                        textInputType: TextInputType.number,
                        label:  provider.numberOfPlayer == 9 ? 'اللاعب الثاني التيم الثاني' :   widget.names.name4,
                        controller: controller4,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            controller4.text = '0';
                          }
                          return null;
                        }),
                  ) : Container(),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  provider.numberOfPlayer == 5 || provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? Expanded(
                    child: CustomFormField(
                        textInputType: TextInputType.number,
                        label: widget.names.name5,
                        controller: controller5,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            controller5.text = '0';
                          }
                          return null;
                        }),
                  ) : Container(),
                  const SizedBox(
                    width: 8,
                  ),
                  provider.numberOfPlayer == 6 || provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? Expanded(
                    child: CustomFormField(
                        textInputType: TextInputType.number,
                        label: widget.names.name6,
                        controller: controller6,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            controller6.text = '0';
                          }
                          return null;
                        }),
                  ) : Container(),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  provider.numberOfPlayer == 7 || provider.numberOfPlayer == 8 ? Expanded(
                    child: CustomFormField(
                        textInputType: TextInputType.number,
                        label: widget.names.name7,
                        controller: controller7,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            controller7.text = '0';
                          }
                          return null;
                        }),
                  ) : Container(),
                  const SizedBox(
                    width: 8,
                  ),
                  provider.numberOfPlayer == 8 ? Expanded(
                    child: CustomFormField(
                        textInputType: TextInputType.number,
                        label: widget.names.name8,
                        controller: controller8,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            controller8.text = '0';
                          }
                          return null;
                        }),
                  ) : Container(),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white12, elevation: 0,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  onPressed: () {
                    add();
                  },
                  child: const Text('Add',style: TextStyle(
                    color: Colors.white,
                  ),)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white12, elevation: 0,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  onPressed: () {
                    add2();
                  },
                  child: const Text('Double X2',style: TextStyle(
                    color: Colors.white,
                  ),)),
              ElevatedButton(
                  style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.white12, elevation: 0,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  onPressed: () async{
                    provider.deleteLastElement();
                    if (isInterstitialAdLoaded == true) {
                      await _interstitialAd.show();
                    }
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'أحذف اخر جولة',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void add() async{
    if (!formKey.currentState!.validate()){
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
    else if(scoreProvider.numberOfPlayer == 9){
      scoreProvider.addValueInListSahebSahbo(
        controller1.text,
        controller2.text,
        controller3.text,
        controller4.text
      );
    }
    if (isInterstitialAdLoaded == true) {
      await _interstitialAd.show();
    }
    Navigator.pop(context);
  }
  void add2() async{
    if (!formKey.currentState!.validate()) {
      return;
    }
    var scoreProvider =
        Provider.of<ScoreBoardViewModel>(context, listen: false);
    if(scoreProvider.numberOfPlayer == 2){
      scoreProvider.addValueInList2Player(
        // controller1.text,
        (int.parse(controller1.text)*2).toString(),
        (int.parse(controller2.text)*2).toString(),
      );
    }
    else if(scoreProvider.numberOfPlayer == 9){
      scoreProvider.addValueInListSahebSahbo(
      (int.parse(controller1.text)*2).toString(),
      (int.parse(controller2.text)*2).toString(),
      (int.parse(controller3.text)*2).toString(),
      (int.parse(controller4.text)*2).toString(),
      );
    }
    else if(scoreProvider.numberOfPlayer == 3){
      scoreProvider.addValueInList3Player(
        (int.parse(controller1.text)*2).toString(),
        (int.parse(controller2.text)*2).toString(),
        (int.parse(controller3.text)*2).toString(),
      );
    }
    else if(scoreProvider.numberOfPlayer == 4){
      scoreProvider.addValueInList4Player(
        (int.parse(controller1.text)*2).toString(),
        (int.parse(controller2.text)*2).toString(),
        (int.parse(controller3.text)*2).toString(),
        (int.parse(controller4.text)*2).toString(),
      );
    }
    else if(scoreProvider.numberOfPlayer == 5){
      scoreProvider.addValueInList5Player(
        (int.parse(controller1.text)*2).toString(),
        (int.parse(controller2.text)*2).toString(),
        (int.parse(controller3.text)*2).toString(),
        (int.parse(controller4.text)*2).toString(),
        (int.parse(controller5.text)*2).toString(),
      );
    }
    else if(scoreProvider.numberOfPlayer == 6){
      scoreProvider.addValueInList6Player(
        (int.parse(controller1.text)*2).toString(),
        (int.parse(controller2.text)*2).toString(),
        (int.parse(controller3.text)*2).toString(),
        (int.parse(controller4.text)*2).toString(),
        (int.parse(controller5.text)*2).toString(),
        (int.parse(controller6.text)*2).toString(),
      );
    }
    else if(scoreProvider.numberOfPlayer == 7){
      scoreProvider.addValueInList7Player(
        (int.parse(controller1.text)*2).toString(),
        (int.parse(controller2.text)*2).toString(),
        (int.parse(controller3.text)*2).toString(),
        (int.parse(controller4.text)*2).toString(),
        (int.parse(controller5.text)*2).toString(),
        (int.parse(controller6.text)*2).toString(),
        (int.parse(controller7.text)*2).toString(),
      );
    }
    else if(scoreProvider.numberOfPlayer == 8){
      scoreProvider.addValueInList8Player(
        (int.parse(controller1.text)*2).toString(),
        (int.parse(controller2.text)*2).toString(),
        (int.parse(controller3.text)*2).toString(),
        (int.parse(controller4.text)*2).toString(),
        (int.parse(controller5.text)*2).toString(),
        (int.parse(controller6.text)*2).toString(),
        (int.parse(controller7.text)*2).toString(),
        (int.parse(controller8.text)*2).toString(),
      );
    }
    if (isInterstitialAdLoaded == true) {
      await _interstitialAd.show();
    }
    Navigator.pop(context);
  }

}
