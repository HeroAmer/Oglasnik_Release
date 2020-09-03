import 'package:Oglasnik/utils/shared/sharedTextFields.dart/SigninTextFields/emailSigninTextField.dart';
import 'package:Oglasnik/view/SignInPage/widgets/signFormIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EmailSignInForm extends StatelessWidget {
  const EmailSignInForm({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final FormSignIn widget;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10),
      child: new SizedBox(
        width: double.infinity,
        child: Container(
          child: EmailSignInTextField(widget: widget),
        ),
      ),
    );
  }
}
