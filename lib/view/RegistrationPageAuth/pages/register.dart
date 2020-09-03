import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/PageLogos/mainLogo.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/backButtonsIphone/backButtonIphone.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/registerButton.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/formSignUp.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/registerBottomToggle.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/signUpFormName.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/welcomeScreen.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:Oglasnik/viewModel/Register/registerViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/checkingInternet.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({Key key, this.toggleView}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  initState() {
    InternetConnectivity().checkForConnectivity();
    cleanRegister();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      onTap: () {
        onTapRemoveFocusRegister(context);
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: backButtonIphone(context),
        ),
        bottomNavigationBar: RegisterBottomToggleButton(),
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
                      Container(
                        child:
                            AuthService().checkStatus(context, emailRegister),
                      ),
                      SignUpFormName(),
                      FormSignUp(),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
