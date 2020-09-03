import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/RegisterTextFields/emailTextField.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/RegisterTextFields/nameTextField.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/RegisterTextFields/passwordTextField.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/RegisterTextFields/phoneTextField.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/registerButton.dart';
import 'package:flutter/material.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({
    Key key,
  }) : super(key: key);

  @override
  _FormSignUpState createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: registerFormKey,
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.black54,
            errorColor: Colors.red,
          ),
          child: Column(children: <Widget>[
            fullNameInputField(context),
            emailInputField(context),
            passwordInputField(context),
            phoneNumberInputField(context),
            registerButton(context),
          ]),
        ));
  }
}
