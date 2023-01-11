import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cartera/view/bottom_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:page_transition/page_transition.dart';

AudioPlayer _audioPlayer = AudioPlayer();

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _audioPlayer.setAsset("assets/music/lala.mp3");
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  Function player = () {
    _audioPlayer.play();
    return 1;
  };

  // Map<int, Widget> outPut = {1: BottomScreens()};/

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
      function: () => player(),
      backgroundColor: Colors.red,
      nextScreen: BottomScreens(),
      duration: 1,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      animationDuration: const Duration(
        seconds: 1,
      ),
    );
  }
}
