import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart' as globals;

class LogoutButton extends StatefulWidget {
  const LogoutButton({
    Key key,
  }) : super(key: key);

  @override
  _LogoutButtonState createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        globals.email = null;
        print(phoneNumber);
        await FirebaseAuth.instance.signOut();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('email');
        updateProfileEmail = null;
        updateProfileName = null;
        updateProfilePhoneNumber = null;
        Navigator.of(context).pushAndRemoveUntil(
            FadeRoute(page: AnonymousHome()), (Route<dynamic> route) => false);
      },
      icon: Icon(
        Icons.power_settings_new,
        color: Colors.black,
      ),
    );
  }
}
