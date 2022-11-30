import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cartera/view/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 300,
      splash: SizedBox(
        child: Center(
            child: Column(
          children: [
            Text(
              "cArterA",
              style: GoogleFonts.lobster(
                  fontSize: 70, fontWeight: FontWeight.bold),
            ),
          ],
        )),
      ),
      backgroundColor: Colors.red,
      nextScreen: const HomeScreen(),
      duration: 2000,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      animationDuration: const Duration(
        seconds: 1,
      ),
    );
  }
}
