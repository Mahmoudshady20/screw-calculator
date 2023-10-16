import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:skrocalc/ui/home/home_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashscreen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: AnimatedSplashScreen(
          backgroundColor: const Color(0xFF24183e),
          centered: true,
          splashIconSize: MediaQuery.of(context).size.height,
          pageTransitionType: PageTransitionType.fade,
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
              ),
            ],
          ),
          nextScreen: const HomeScreen(),
          duration: 500,
          animationDuration: const Duration(seconds: 1),
          curve: Curves.easeInOutCubic,
        ),
      ),
    );
  }
}