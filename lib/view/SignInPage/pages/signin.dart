import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/PageLogos/mainLogo.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/backButtonsIphone/backButtonIphone.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/welcomeScreen.dart';
import 'package:Oglasnik/view/SignInPage/widgets/SignInBottomToggle.dart';
import 'package:Oglasnik/view/SignInPage/widgets/signFormIn.dart';
import 'package:Oglasnik/view/SignInPage/widgets/prijavaWelcomeScreen.dart';
import 'package:Oglasnik/viewModel/SignIn/signInViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/checkingInternet.dart';

class SigninPage extends StatefulWidget {
  final Function toggleView;
  SigninPage({Key key, this.toggleView}) : super(key: key);
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  FirebaseUser user;
  bool islogin = false;

  @override
  initState() {
    cleanSignIn();
    InternetConnectivity().checkForConnectivity();
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      onTap: () {
        onTapRemoveFocusSignIn(context);
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: backButtonIphone(context),
        ),
        bottomNavigationBar: SignInBottomToggle(),
        body: WillPopScope(
          // ignore: missing_return
          onWillPop: () {
            Navigator.of(context).pushReplacement(
              FadeRoute(page: AnonymousHome()),
            );
          },
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Container(
                  margin: Margin().all(45),
                  child: Column(
                    children: <Widget>[
                      LogoContainer(),
                      WelcomeScreen(),
                      PrijavaWelcomeScreen(),
                      FormSignIn(),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
