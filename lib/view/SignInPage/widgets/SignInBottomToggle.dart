import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInBottomToggle extends StatelessWidget {
  const SignInBottomToggle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 100.0, right: 100.0, bottom: 5.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
          ),
        ),
        color: Colors.white,
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          Navigator.of(context)
              .pushReplacement(FadeRoute(page: RegisterPage()));
        },
        child: Text(
          RegistrationPageAuthSecondWidget().buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
