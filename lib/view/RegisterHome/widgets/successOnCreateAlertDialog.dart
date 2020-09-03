import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successDialogButtons.dart';
import 'package:flutter/material.dart';

AlertDialog successOnCreateAlertDialog(BuildContext context) {
  return new AlertDialog(
    title: Text(
      !azurload
          ? SuccessAlertDialog().cestitamo
          : SuccessAlertDialog().azuriranje,
      style: TextStyle(color: mainAppColor),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                !azurload
                    ? SuccessAlertDialog().opis3
                    : SuccessAlertDialog().azuriranjeopis,
                style: TextStyle(color: alertDialogTextColor),
              ),
              Container(
                margin: Margin().only(3, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    !azurload
                        ? SuccessAlertDialog().opis2
                        : SuccessAlertDialog().empty,
                    style: TextStyle(color: alertDialogTextColor),
                  ),
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: Margin().only(0, 0, 5, 0),
              child: UreduButtonDialog(),
            ),
          ],
        ),
      )
    ],
  );
}
