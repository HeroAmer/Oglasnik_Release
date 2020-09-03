import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/SigninTextFields/emailAlertDialog.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertDialogButtons.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({
    Key key,
  }) : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  @override
  void initState() {
    cleanAlertDialog();
    setState(() {});
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

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
      content: Container(
        margin: EdgeInsets.only(top: 43.0),
        child: Form(
          key: alertFormKey,
          child: EmailAlertDialog(), 
        ),
      ),
      actions: <Widget>[
        Container(
          child: AuthService().allowPasswordChange(context, forgetEmail),
        ),
        AlertDialogButtons(),
      ],
    );
  }
}
