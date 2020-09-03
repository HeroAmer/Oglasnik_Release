import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/internetAlertDialog.dart';

displayInternetDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return TestInternetDialog();
    },
  );
}
