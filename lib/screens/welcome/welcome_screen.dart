import 'package:flutter/material.dart';
import 'package:zen/screens/components/body.dart';
import 'package:zen/screens/splashScreen/splashscreen.dart';
//import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(),
      //body: Center(
      //child: Lottie.network(
      //    "https://assets6.lottiefiles.com/packages/lf20_bsXXgHRDfD.json"),
    );
  }
}
