import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:skrocalc/provider/scoreboard_viewmodel.dart';
import 'package:skrocalc/ui/free/freee.dart';
import 'package:provider/provider.dart';
import 'package:skrocalc/ui/home/home_screen.dart';
import 'package:skrocalc/ui/score_screen/score_screen.dart';
import 'package:skrocalc/ui/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding();
  MobileAds.instance.initialize();
  runApp(ChangeNotifierProvider(
      create: (context) => ScoreBoardViewModel(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => const HomeScreen(),
        ScoreScreen.routeName : (context) => const ScoreScreen(),
        SplashScreen.routeName : (context) => const SplashScreen(),
        Free.routeName : (context) => Free(),
      },
    );
  }
}

