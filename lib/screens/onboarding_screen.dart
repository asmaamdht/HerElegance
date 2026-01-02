import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';
import 'package:her_elegance/screens/login_screen.dart';
import 'package:her_elegance/screens/splash_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static String id = 'onboardingScreen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  double currentDot = 0.0;
  final int dotCount = 3;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      setState(() {
        currentDot += 1;
        if (currentDot >= dotCount) currentDot = 0;
      });
    });

    Future.delayed(Duration(seconds: 5), () {
      _timer.cancel();
      Navigator.pushNamed(context, SplashScreen.id);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset('assets/images/img.png', height: 400),
            SizedBox(height: 20),
            Text(
              'HerElegance',
              style: TextStyle(fontSize: 30, fontFamily: kFontFamily),
            ),

            SizedBox(height: 20),
            DotsIndicator(
              dotsCount: dotCount,
              position: currentDot,
              decorator: DotsDecorator(
                color: const Color(0xDD5B5B5B),
                activeColor: kPrimaryColor,
                size: Size.square(8.0),
                activeSize: Size(12.0, 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
