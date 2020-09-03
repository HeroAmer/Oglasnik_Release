import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NapustiButtonDialog extends StatelessWidget {
  const NapustiButtonDialog({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      color: Colors.white,
      child: Text(
        SuccessAlertDialog().napusti,
        style: TextStyle(
            color: Color.fromARGB(255, 226, 11, 48),
            fontFamily: 'Roboto',
            fontSize: 14),
      ),
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            FadeRoute(page: RegisteredHome()), (Route<dynamic> route) => false);
      },
    );
  }
}
