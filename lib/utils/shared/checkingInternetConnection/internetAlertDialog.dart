import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

class TestInternetDialog extends StatefulWidget {
  @override
  _TestInternetDialogState createState() => _TestInternetDialogState();
}

class _TestInternetDialogState extends State<TestInternetDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: alertDialogBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: alertDialogBorderColor,
        ),
      ),
      title: Container(
          child: Text(
        InternetConnectionMessage().errorHead,
      )),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              InternetConnectionMessage().errorBody,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                    color: mainAppColor,
                    child: Text(
                      InternetConnectionMessage().buttonOK,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 14),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              )
            ],
          ),
        ),
      ],
    );
  }
}
