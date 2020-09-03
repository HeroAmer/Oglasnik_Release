import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BlackSpinnerCircular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.black,
      child: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }
}
