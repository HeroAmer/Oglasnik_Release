import 'package:Oglasnik/utils/strings.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class OglasnikMoto extends StatelessWidget {
  const OglasnikMoto({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 180),
          child: FadeAnimatedTextKit(
            onTap: () {
              print("Animacija teksta");
            },
            text: [SplashScreen().animationText],
            duration: Duration(milliseconds: 1500),
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    );
  }
}
