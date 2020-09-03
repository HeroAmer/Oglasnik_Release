import 'package:Oglasnik/view/SignInPage/widgets/alertDialogWidget.dart';
import 'package:flutter/material.dart';
import 'alertDialogWidget.dart';

String emailAlertDialog;
displayDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialogWidget();
    },
  );
}
