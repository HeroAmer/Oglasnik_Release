import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/SignInPage/pages/signin.dart';
import 'package:flutter/material.dart';

class PrijavaButton extends StatelessWidget {
  const PrijavaButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 84.0, left: 10.0),
      child: SizedBox.fromSize(
        size: Size(80, 80), // button width and height
        child: ClipOval(
          child: Material(
            color: Colors.transparent, // button color
            child: InkWell(
              splashColor: Colors.transparent, // splash color
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    FadeRoute(page: SigninPage()),
                    (Route<dynamic> route) => false);
              },

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.person), // icon
                  Text("Prijava"), // text
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
