import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: Margin().only(0, 40, 0, 0),
              ),
              Container(
                width: 350,
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
