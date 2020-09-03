import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

class ProfileText extends StatelessWidget {
  const ProfileText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Titles().updateProfile,
        style: TextStyle(fontFamily: "Roboto", fontSize: 20),
      ),
    );
  }
}
