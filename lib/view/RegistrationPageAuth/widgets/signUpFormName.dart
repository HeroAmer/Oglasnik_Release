import 'package:flutter/material.dart';

class SignUpFormName extends StatefulWidget {
  const SignUpFormName({
    Key key,
  }) : super(key: key);

  @override
  _SignUpFormNameState createState() => _SignUpFormNameState();
}

class _SignUpFormNameState extends State<SignUpFormName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        'Registracija',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    );
  }
}
