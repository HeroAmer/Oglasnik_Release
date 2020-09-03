import 'package:Oglasnik/view/PostScreens/Widgets/leaveAlertDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

IconButton newInputBackButtonIphone(BuildContext context) {
  return IconButton(
      icon: Icon(
        Icons.clear,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return leaveAlertDialog(context);
            });
      });
}
