import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: Container(
        // height: SizeConfig.blockSizeVertical * 100 - 200,
        color: Colors.white,
        child: Center(
          child: Column(
            //ovaj dio koda je radio  : Amer
            children: <Widget>[
              Container(
                margin: Margin().only(0, 35, 0, 0),
              ),
              Container(
                width: 350,
                padding:
                    EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 4),
                child: Text(
                  !azurload
                      ? LoadingText().kreiranjeText
                      : LoadingText().updateText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: mainAppColor,
                      fontSize: SizeConfig.safeBlockVertical * 3),
                ),
              ),
              SpinKitCircle(
                color: mainAppColor,
                size: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
