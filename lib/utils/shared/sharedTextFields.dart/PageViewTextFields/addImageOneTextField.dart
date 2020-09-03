import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

class AddImageOne extends StatelessWidget {
  const AddImageOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Text(
        createSwitcher
            ? img1
            : img1 != immutableImg1
                ? img1
                : image1Name != null ? image1Name : img1,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
