import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/myPosts.dart';
import 'package:Oglasnik/view/SignInPage/widgets/formSignInFields/signInButtonForm.dart';
import 'package:flutter/material.dart';

class MojiOglasiButton extends StatefulWidget {
  const MojiOglasiButton({Key key, this.email}) : super(key: key);
  final String email;

  @override
  _MojiOglasiButtonState createState() => _MojiOglasiButtonState();
}

class _MojiOglasiButtonState extends State<MojiOglasiButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Margin().only(0, 2, 0, 0),
      child: SizedBox.fromSize(
        size: Size(80, 80), // button width and height
        child: ClipOval(
          child: Material(
            color: Colors.transparent, // button color
            child: InkWell(
              splashColor: Colors.transparent, // splash color
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(FadeRoute(page: MyPosts(email: email)));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.assignment), // icon
                  Text(
                    "Moji oglasi",
                    textAlign: TextAlign.center,
                  ),
                  // text
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
