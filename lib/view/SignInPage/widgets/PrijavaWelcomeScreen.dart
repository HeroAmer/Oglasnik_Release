import 'package:flutter/material.dart';

class PrijavaWelcomeScreen extends StatefulWidget {
  const PrijavaWelcomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _PrijavaWelcomeScreenState createState() => _PrijavaWelcomeScreenState();
}

class _PrijavaWelcomeScreenState extends State<PrijavaWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10.0),
      alignment: Alignment.centerLeft,
      child: Text(
        'Prijava',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    );
  }
}
