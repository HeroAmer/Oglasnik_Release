import 'package:Oglasnik/view/PostScreens/Widgets/napustiLeaveAlertDialogButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/deleteDialogButtons.dart';
import 'package:flutter/material.dart';

class LeaveAlertDialogButtons extends StatelessWidget {
  const LeaveAlertDialogButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: NapustiButtonDialog(),
          ),
          Container(
            child: OdustaniButtonDialog(),
          ),
        ],
      ),
    );
  }
}
