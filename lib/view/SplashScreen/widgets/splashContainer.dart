import 'package:Oglasnik/utils/shared/PageLogos/splashLogo.dart';
import 'package:Oglasnik/view/SplashScreen/widgets/oglasnikMoto.dart';
import 'package:flutter/material.dart';

class SplashContainer extends StatelessWidget {
  const SplashContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 100),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(60, 255, 255, 255),
                ),
                width: 110,
                height: 113,
              ),
              SplashLogo(),
            ],
          ),
        ),
        OglasnikMoto(),
      ],
    );
  }
}