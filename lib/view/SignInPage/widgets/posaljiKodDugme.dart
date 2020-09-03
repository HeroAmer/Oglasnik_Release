import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/viewModel/SignIn/signInViewModel.dart';
import 'package:flutter/material.dart';

class PosaljiKodDugme extends StatefulWidget {
  const PosaljiKodDugme({
    Key key,
  }) : super(key: key);

  @override
  _PosaljiKodDugmeState createState() => _PosaljiKodDugmeState();
}

class _PosaljiKodDugmeState extends State<PosaljiKodDugme> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
          color: mainAppColor,
          child: Text(
            'POŠALJI KOD',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Roboto', fontSize: 14),
          ),
          onPressed: () {
            onPressedPosaljiKod(context);
          }),
    );
  }
}
