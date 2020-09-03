import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/SignInPage/widgets/formSignInFields/forgotPassText.dart';
import 'package:Oglasnik/view/SignInPage/widgets/formSignInFields/PasswordSignInForm.dart';
import 'package:Oglasnik/view/SignInPage/widgets/formSignInFields/SignInButtonForm.dart';
import 'package:Oglasnik/view/SignInPage/widgets/formSignInFields/authentication.dart';
import 'package:Oglasnik/view/SignInPage/widgets/formSignInFields/emailSignInForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class FormSignIn extends StatefulWidget {
  FormSignIn({
    Key key,
  }) : super(key: key);

  @override
  _FormSignInState createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: signInFormKey,
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.black54,
            errorColor: Colors.red,
          ),
          child: Column(
            children: <Widget>[
              EmailSignInForm(widget: widget),
              PasswordSignInForm(widget: widget),
              Authentication(),
              SignInButtonForm(widget: widget),
              ForgotPassSignInText()
            ],
          ),
        ));
  }
}
