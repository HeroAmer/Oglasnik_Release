import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successDialogButtons.dart';
import 'package:flutter/material.dart';

AlertDialog successAlertDialog(BuildContext context) {
  return new AlertDialog(
    title: Text(
      SuccessAlertDialog().odlicno,
      style: TextStyle(color: mainAppColor),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Column(
            children: [
              Text(
                SuccessAlertDialog().opis1,
                style: TextStyle(color: alertDialogTextColor),
              ),
              Container(
                margin: Margin().only(3, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  SuccessAlertDialog().opis2,
                  style: TextStyle(color: alertDialogTextColor),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    backgroundColor: successDialogBgColor,
    elevation: 10,
    actions: <Widget>[
      Container(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: KreirajButtonDialog(),
            ),
            Container(
              child: UreduButtonDialog(),
            ),
          ],
        ),
      )
    ],
  );
}
