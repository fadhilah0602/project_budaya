import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_uts/page/onboarding_screen1.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => OnboardingScreen1()));
    });
    return SafeArea(
        child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/gambar1.jpg',
            fit: BoxFit.cover,
          ),
        ],
      ),
    ));
  }
}
