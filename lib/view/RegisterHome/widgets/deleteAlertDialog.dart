import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/deleteDialogButtons.dart';
import 'package:flutter/material.dart';

deleteAlertDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          SuccessAlertDialog().obrisinaslov,
          style: TextStyle(color: mainAppColor),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    SuccessAlertDialog().obrisitext,
                    style: TextStyle(color: alertDialogTextColor),
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
                // Container(
                //   child: DeleteButtonDialog(),
                // ),
                Container(
                  child: OdustaniButtonDialog(),
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}
