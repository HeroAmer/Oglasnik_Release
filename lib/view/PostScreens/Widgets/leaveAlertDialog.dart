import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/leaveAlertDialogButtons.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/leaveAlertDialogTexts.dart';
import 'package:flutter/material.dart';

AlertDialog leaveAlertDialog(BuildContext context) {
  return new AlertDialog(
    title: Text(
      SuccessAlertDialog().leave,
      style: TextStyle(color: mainAppColor),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LeaveAlertDialogTexts(),
      ],
    ),
    backgroundColor: successDialogBgColor,
    elevation: 10,
    actions: <Widget>[
      LeaveAlertDialogButtons(),
    ],
  );
}
