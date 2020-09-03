import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/cupertino.dart';

class LeaveAlertDialogTexts extends StatelessWidget {
  const LeaveAlertDialogTexts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SuccessAlertDialog().leaveopis,
            style: TextStyle(color: alertDialogTextColor),
          ),
          Container(
            margin: Margin().only(3, 0, 0, 0),
            child: Text(
              SuccessAlertDialog().leaveopis2,
              style: TextStyle(color: alertDialogTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
