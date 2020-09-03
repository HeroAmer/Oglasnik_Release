import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              Welcome().dobrodosli,
              style: TextStyle(fontSize: 22),
            ),
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }
}
