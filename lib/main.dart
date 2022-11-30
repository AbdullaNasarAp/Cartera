import 'package:cartera/view/home/homescreen.dart';
import 'package:cartera/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: GoogleFonts.montserrat(),
          bodyText2: GoogleFonts.montserrat(),
        ),
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
      ),
    );
  }
}
