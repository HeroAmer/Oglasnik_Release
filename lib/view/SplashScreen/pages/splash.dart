import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/SplashScreen/widgets/splashContainer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:Oglasnik/viewModel/SplashViewModel/splashViewModel.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () => splashScreenRouter());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 11, 48),
      body: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: SplashContainer(),
      ),
    );
  }
}
