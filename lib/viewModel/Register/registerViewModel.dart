import 'dart:async';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:Oglasnik/viewModel/SignIn/signInViewModel.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart' as globals;
import 'package:Oglasnik/utils/globals.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/internetDialog.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/checkingInternet.dart';
import 'package:random_string/random_string.dart';

void onPressedRegister(BuildContext context, String fullName, String email,
    String password, String phoneNumber) async {
  FocusScope.of(context).unfocus();
  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
  String userID = randomAlphaNumeric(20);
  await InternetConnectivity().checkForConnectivity();
  if (hasActiveConnection) {
    Timer(Duration(seconds: 1), () {
      if (registerFormKey.currentState.validate() && allowUserToRegister) {
        db.collection("firestoreUsers").document(userID).setData({
          'fullName': registerFullName,
          'email': registerEmail,
          'password': registerPassword,
          'phoneNumber': registerPhoneNumber,
          'userID': userID,
        });

        db.collection("usersEmail").document(registerEmail).setData({
          'fullName': registerFullName,
          'email': registerEmail,
          'password': registerPassword,
          'phoneNumber': registerPhoneNumber,
          'userID': userID,
        });

        print('korisnik uspješno ubačen u bazi');

        loginPrefs(context, registerEmail, userID);

        globals.email = registerEmail;
        registeredGlob = true;

        favoritesList.clear();
        FavoriteProduct().getAllFavoritesIDs().then((value) =>
            {for (final x in value) favoritesList.add(x['productID'])});

        Navigator.of(context).pushReplacement(
          FadeRoute(page: RegisteredHome()),
        );
      } else {
        print('korisnik već u bazi, registracija nije uspjela');
      }
    });
  } else
    displayInternetDialog(context);
}

void onTapRemoveFocusRegister(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    currentFocus.focusedChild.unfocus();
  }
}
