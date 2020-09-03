import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/bookmarkedPosts.dart';
import 'package:flutter/material.dart';

class SacuvanoButton extends StatelessWidget {
  const SacuvanoButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Margin().only(0, 7, 0, 0),
      child: SizedBox.fromSize(
        size: Size(80, 80), // button width and height
        child: ClipOval(
          child: Material(
            color: Colors.transparent, // button color
            child: InkWell(
              splashColor: Colors.transparent, // splash color
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(FadeRoute(page: BookmarkedPosts()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star), // icon
                  Text("Sačuvano"),
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
