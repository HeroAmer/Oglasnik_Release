import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:flutter/material.dart';

class RegistracijaButton extends StatelessWidget {
  const RegistracijaButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox.fromSize(
        size: Size(110, 80), // button width and height
        child: ClipOval(
          child: Material(
            color: Colors.transparent, // button color
            child: InkWell(
              splashColor: Colors.transparent, // splash color
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    FadeRoute(page: RegisterPage()),
                    (Route<dynamic> route) => false);
              }, // button pressed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.person_add), // icon
                  Text("Registracija"), // text
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
