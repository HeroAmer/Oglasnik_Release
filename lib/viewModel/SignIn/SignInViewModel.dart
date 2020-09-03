import 'dart:async';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successAlertDialog.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successOnCreateAlertDialog.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Oglasnik/utils/globals.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/internetDialog.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/checkingInternet.dart';

///When user enter his email on AlertDialog, onPressed "odustani" is bellow:
void alerDialogOnPressedOdustani(BuildContext context) {
  Navigator.of(context).pop();
}

///funkcija kojom provjeravamo da li cemo pustiti usera da se sign in
///prvobitno se provjerava status konekcije sa isOnline, ako jeste
///provjerava se da li su inputi ispravni i da li postoji u bazi preko varijable status
void onPressedSignInModel(
  BuildContext context,
  String email,
  String password,
) async {
  FocusScope.of(context).unfocus();
  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
  print('Internet konekcija dostupna: ' + hasInternetConnection.toString());
  await InternetConnectivity().checkForConnectivity();

  if (hasActiveConnection) {
    Timer(Duration(seconds: 1), () {
      if (signInFormKey.currentState.validate() && status == true) {
        print('Logged in');
        globals.email = email;

        registeredGlob = false;
        favoritesList.clear();
        FavoriteProduct().getAllFavoritesIDs().then((value) =>
            {for (final x in value) favoritesList.add(x['productID'])});
        loginPrefs(context, email, null);
        Navigator.of(context).pushReplacement(
          FadeRoute(
            page: RegisteredHome(),
          ),
        );
      } else {
        print('Email ili password nisu tacni');
      }
    });
  } else
    displayInternetDialog(context);
}

///Metoda kojom preko SharedPrefernces zapamtimo koji se user log in
///da bi kasnije na splash screenu mogli provjeravati da li se user prethodno logovao
void loginPrefs(BuildContext context, String email, String userID) async {
  phoneNumberSetting(email);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
  if (userID != null) {
    prefs.setString('userID', userID);
    userIDGlobal = userID;
  } else {
    userIDGlobal = await getUserID(email);
    prefs.setString('userID', userIDGlobal);
  }
  //prefs.setString('phoneNumber', phoneNumber);
}

Future getUserID(String email) async {
  final QuerySnapshot qs = await Firestore.instance
      .collection('firestoreUsers')
      .where('email', isEqualTo: email)
      .getDocuments();

  final List<DocumentSnapshot> ds = qs.documents;

  return ds[0]['userID'];
}

///Query kojim provjeravamo da li je željeni user unio broj telefona u bazu
///ako jeste, dodjeljujemo value iz baze u varijablu phoneNumber
void phoneNumberSetting(String email) async {
  // ignore: await_only_futures
  final userQuery = await Firestore.instance
      .collection('firestoreUsers')
      .where('email', isEqualTo: email)
      .limit(1);
  //print(userQuery.getDocuments());
  userQuery.getDocuments().then((data) {
    if (data.documents.length > 0) {
      phoneNumber = data.documents[0].data['phoneNumber'];
    }
  });
}

///Future builder kojim provjeravamo da li je user unio email koji postoji u bazi
///u alert dialog za promjenu passworda, ako ukucani email postoji u bazi
///globalnu varijablu allowUserToChangePassword na true, na osnovu koje ćemo ga poslati na screen
///gdje ce ukucati token i novi password
///

List<DocumentSnapshot> testUser = List<DocumentSnapshot>();
allowPasswordChange(BuildContext context, String email) {
  FutureBuilder(
      future: AuthService().isEmailValid(email),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          testUser = snapshot.data.documents;
          //print(testUser[0]["email"]);

          // (email != testUser[0]["email"])
          //     ? allowUserToChangePassword = true
          //     : allowUserToChangePassword = false;
          allowUserToChangePassword = true;
          print('korisnik postoji');
          return Container();
        } else {
          print('korisnik nije u bazi');
          allowUserToChangePassword = false;
          return Container();
        }
      });
}

///Kada se user registruje, on se šalje na registered home, gdje mu iskače "čestitamo" alert dialog,
///da bi spriječili da se svaki put pokazuje taj dialog kada se user navigira na registeredHome,
///po iskakanju aler dialoga, postavljamo globalnu varijablu registeredGlob na false, da se više ne bi ponavljao
registeredShowDialog(BuildContext context) {
  if (registeredGlob) {
    registeredGlob = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) => successAlertDialog(context));
    });
  }
}

///Po kreiranju novog artikla, user se navigira na registered home, gdje dobija alert dialog koji ga
///obavjestava da je kreirao novi artikal, da bi sprijecili nepotrebno iskakanje alert dialoga kada se user
///navigira kroz aplikaciju, taj problem smo riješili koristenjem createdGlob globalne varijable koja prati da li je user
///zaista kreirao artikal ili je nekim drugim putem dosao do screena gdje iskace alert dialog.
createdShowDialog(BuildContext context) {
  if (createdGlob) {
    createdGlob = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) =>
              successOnCreateAlertDialog(context));
    });
  }
}

///When user enter his email on AlertDialog, button "pošalji" is configured bellow
void onPressedPosaljiKod(BuildContext context) async {
  Container(child: AuthService().allowPasswordChange(context, forgetEmail));
  await AuthService().onPressedAlertDialog(context);
}

void onTapRemoveFocusSignIn(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    currentFocus.focusedChild.unfocus();
  }
}
