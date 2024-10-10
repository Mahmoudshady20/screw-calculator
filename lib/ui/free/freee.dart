import 'package:flutter/material.dart';
import 'package:skrocalc/ui/free/tex.dart';

class Free extends StatelessWidget {
  static const String routeName = 'freee';
  final List<String> texs = [
      ' اللهم لا تجعل للكافرين علي المؤمنين سبيلا',
      'اللهم منزل الكتاب ومجرى السحاب وهازم الأحزاب انصر المجاهدين على اليهود وحلفائهم',
      ' اللهم أنزل عليهم بأسك الذي لا يرد عن القوم المجرمين،',
      'اللهم عليك بالصهاينة وحلفائهم شتت شملهم فرق جمعهم أسقط طائراتهم أغرق اساطيلهم أحرق دباباتهم اقذف الرعب في قلوب جنودهم ياقوي يامتين',
      ' اللهم زلزل أقدامهم ونكس أعلامهم وأذهب ريحهم وانصر فلسطين عليهم يا الله'
      'اللهُمَّ يا من لا يُهزم جُنده و لا يخلف وعدُه، ولا إله غيره، كُن لأهلنا في قطاع غزة وفلسطين  عوناً و نصيراً، و معيناً و ظهيراً، اللهُمَّ انصرهم و لا تنصر عليهم اللهمَّ أنزل عليهم صبراً أضعاف ما نزل عليهم من البلاء وأيدهم بجنودٍ من عندك '
      'اللهُمَّ لا ترفع لليهود راية، ولا تحقق لهم غاية و اجعلهم لمن خلفهم عبرة وآية ياجبار يامنتقم.'
      'آمن روعاتهم، واستر عوراتهم، ونجّهم من الخوف والفزَع ومن الجوع والجزَع واجزهم عن مشقّة الحياة الفانية بما صبروا جنّةً وحريرا.'
      'اللهم إن الناس قد تخلوا عنهم،فلا تتخلَى أنت عنهم'
      'اللهم أطعمهم من جوعٍ وآمنهم من خوف.'
      'اللهم أنزل سلامك وأمنك وسكينتك عليهم،',
  ];

  Free({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF24183e),
        appBar: AppBar(
          backgroundColor: const Color(0xff382c52),
          centerTitle: true,
          title: const Text('ف.ـلسطيــن حرة',style: TextStyle(
            color: Colors.white,
          ),),
        ),
        body: ListView.separated(
          physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Tex(tex: texs[index]),
            separatorBuilder: (context, index) => Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xFFec8b03),
                ),
            itemCount: texs.length));
  }
}
