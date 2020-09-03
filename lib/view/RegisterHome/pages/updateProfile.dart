import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileChangePassButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileForm.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileSaveButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileText.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/logoutButton.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: <Widget>[
            LogoutButton(),
          ],
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.of(context)
                .pushReplacement(FadeRoute(page: RegisteredHome())),
          ),
        ),
        body: WillPopScope(
          // ignore: missing_return
          onWillPop: () {
            Navigator.of(context).pushReplacement(
              FadeRoute(page: RegisteredHome()),
            );
          },
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProfileText(),
                  ProfileForm(),
                  ProfileChangePassButton(),
                  ProfileSaveButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
