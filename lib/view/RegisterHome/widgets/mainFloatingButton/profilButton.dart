import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/updateProfile.dart';
import 'package:flutter/material.dart';

class ProfilButton extends StatelessWidget {
  const ProfilButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox.fromSize(
        size: Size(80, 80), // button width and height
        child: ClipOval(
          child: Material(
            color: Colors.transparent, // button color
            child: InkWell(
              splashColor: Colors.transparent, // splash color
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(FadeRoute(page: UpdateProfile()));
              }, // button pressed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.face), // icon
                  Text("Profil"), // text
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
