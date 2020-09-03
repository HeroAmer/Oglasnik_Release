import 'package:flutter/material.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:flutter/cupertino.dart';

class ForgotPassSignInText extends StatelessWidget {
  const ForgotPassSignInText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: new GestureDetector(
        onTap: () => displayDialog(context),
        child: new Text(
          "Zaboravili ste lozinku?",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              color: Color.fromRGBO(0, 0, 0, 100)),
        ),
      ),
    );
  }
}
