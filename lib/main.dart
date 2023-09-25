import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrocalc/provider/scoreboard_viewmodel.dart';
import 'package:skrocalc/ui/home/home_screen.dart';
import 'package:skrocalc/ui/score_screen/score_screen.dart';

void main() {

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
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        ScoreScreen.routeName : (context) => ScoreScreen()
      },
    );
  }
}

