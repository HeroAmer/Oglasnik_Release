import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

class OdustaniButtonDialog extends StatelessWidget {
  const OdustaniButtonDialog({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
        color: Colors.white,
        child: Text(
          SuccessAlertDialog().odustani,
          style: TextStyle(
              color: Color.fromARGB(255, 226, 11, 48),
              fontFamily: 'Roboto',
              fontSize: 14),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }
}
