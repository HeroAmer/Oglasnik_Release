import 'dart:async';
import 'package:Oglasnik/interface/authUserInterface.dart';
import 'package:Oglasnik/model/userModel.dart';
import 'package:Oglasnik/utils/globals.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/checkingInternet.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/internetDialog.dart';
// import 'package:Oglasnik/utils/shared/globalVariables.dart' as globals;
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/viewModel/SignIn/sendMail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool validSignIn = false;
bool validPasswordReset = false;
final AnonymousViewModel auth = AnonymousViewModel();

class AuthService extends ChangeNotifier {
// FUTURE BUILDER FOR REGISTER
  // ignore: missing_return
  Future<bool> userExistingorNot(String email) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        .where('email', isEqualTo: registerEmail)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    if (documents.length > 0) {
      allowUserToRegister = false;
      print("Hoce li pustiti Usera da se registruje: " +
          allowUserToRegister.toString());
    } else {
      print("Hoce li pustiti Usera da se registruje" +
          allowUserToRegister.toString());
      allowUserToRegister = true;
      print(allowUserToRegister);
    }
  }

  checkStatus(BuildContext context, String email) {
    FutureBuilder(
        future: AuthService().userExistingorNot(email),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            allowUserToRegister = false;
            print('korisnik postoji');
            allowUserToRegister = false;
            return Container();
          } else {
            allowUserToRegister = true;
            print('korisnik nije u bazi');
            return Container();
          }
        });
  }

  onPressedAlertDialog(
    BuildContext context,
  ) async {
    String token = randomAlphaNumeric(5);
    FocusScope.of(context).unfocus();
    FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
    await InternetConnectivity().checkForConnectivity();
    print('email: ' + email.toString());
    (hasActiveConnection)
        // ? (globals.email != null)
        ? Timer(Duration(milliseconds: 1000), () async {
            if (alertFormKey.currentState.validate() &&
                allowUserToChangePassword == true) {
              await AuthService().checkUserEmail(forgetEmail);

              WidgetsBinding.instance.addPostFrameCallback((_) {});
              db
                  .collection("firestoreUsers")
                  .document(userIDGlobal)
                  .updateData({
                // 'email': email,
                'token': token,
              });
              Navigator.of(context)
                  .pushReplacement(FadeRoute(page: PasswordChange(email)));
              sendemail(token);
              // globals.userIDGlobal = null;
              // globals.forgetEmail = '';
              print('Za korisnika: ' +
                  email.toString() +
                  ' uspješno generisan token(na mail i firestore poslan), a on je: ' +
                  token);
            } else {
              print('Korisnik ne postoji u bazi!');
            }
          })
        // : Timer(Duration(milliseconds: 1000), () {
        //     print('Korisnik nije logovan, ovaj dio potrebno je uraditi!');
        //   })
        : displayInternetDialog(context);
  }

//if statement must be replaced with correct validation
  void onPressedChangePassword(
    BuildContext context,
    String email,
    String newPassword,
    String passwordConfirm,
    String token,
  ) async {
    print('token: ' + token.toString());
    print('password: ' + newPassword.toString());
    print('confirm password: ' + passwordConfirm.toString());
    FocusScope.of(context).unfocus();
    FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
    Timer(Duration(seconds: 1), () async {
      if (passwordChangeFormKey.currentState.validate() &&
          tokenstatus == true &&
          newPassword == passwordConfirm) {
        db.collection("firestoreUsers").document(userIDGlobal).updateData({
          //'email': email,
          'token': '',
          'password': newPassword,
        });
        // print(email.toString());
        // print('korisniku sa emailom: ' +
        //     email.toString() +
        //     ' uspješno promijenjena lozinka. \nNova lozinka je: ' +
        //     newPassword);
        // email = null;

        // phoneNumber = null;
        await FirebaseAuth.instance.signOut();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('email');
        prefs.remove('phoneNumber');
        // print("email: " +
        //     email.toString() +
        //     " phoneNumber: " +
        //     phoneNumber.toString());
        Navigator.of(context).pushAndRemoveUntil(
            FadeRoute(page: AnonymousHome()), (Route<dynamic> route) => false);
      }
      if (newPassword != passwordConfirm) {
        doesMatch = true;
        Timer(Duration(seconds: 1), () {
          doesMatch = false;
        });
        nepoklapanje = true;
        print('lozinke se ne poklapaju');
      }
    });
    // globals.userIDGlobal = null;
  }

//tokenChecker
// Da li prima prave inpute?
  Future<bool> istokenCorrect(String email, String token) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        .where('email', isEqualTo: email)
        .where('token', isEqualTo: token)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> dokument = result.documents;
    if (dokument.length > 0) {
      tokenstatus = true;
      print("Email|Token status validacije je: " + tokenstatus.toString());
      return true;
    } else {
      tokenstatus = false;
      print("Email|Token status validacije je: " + tokenstatus.toString());
      print(tokenstatus);
      return false;
    }
  }

  //checking users token input (and comparing with firebase token field)
  tokenExistOrNot(BuildContext context, String email, String token) {
    FutureBuilder(
        future: AuthService().istokenCorrect(email, token),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            validPasswordReset = true;
            print('Token za korisnika: ' + email + ' postoji u bazi');
            return Container();
          } else {
            print('Token za korisnika: ' + email + 'NE POSTOJI u bazi');
            return Container();
          }
        });
  }

// SIGN IN
// FUTURE BUILDER ZA LOGIN (HOCE LI GA PUSTITI DA SE LOG IN)
  // ignore: missing_return
  Future<bool> isUserRegistered(String email, String password) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> dokument = result.documents;
    if (dokument.length > 0) {
      status = true;
      print("Trenutni status (print od SignIn-a):" + status.toString());
    } else {
      status = false;
      print("Trenutni status(print od SignIn-a):" + status.toString());
    }
  }

  signInOrNot(BuildContext context, String email, String password) {
    FutureBuilder(
        future: AuthService().isUserRegistered(email, password),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            validSignIn = true;
            status = true;
            print('korisnik postoji');
            return Container();
          } else {
            print('korisnik nije u bazi');
            status = false;
            return Container();
          }
        });
  }

//alert dialog checker
//FUTURE BUILDER ZA ALERT DIALOG (HOCE LI MU PUSTITI DA PROMIJENI PASSWORD)
//best case for checking user in database!
  // ignore: missing_return
  Future<bool> isEmailValid(String email) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        .where('email', isEqualTo: email)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> emailDoc = result.documents;
    if (emailDoc.length > 0) {
      allowUserToChangePassword = true;
      print("Trenutni status Alert Dialoga:" +
          allowUserToChangePassword.toString());
    } else {
      allowUserToChangePassword = false;
      print("else: Trenutni status Alert Dialoga:" +
          allowUserToChangePassword.toString());
    }
  }

  checkUserEmail(String userEmail) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('usersEmail')
        .where('email', isEqualTo: userEmail)
        .limit(1)
        .getDocuments();
    currentUser.clear();
    currentUser = result.documents;
    userIDGlobal = currentUser[0]['userID'];
    print('rezultat userIDGlobal: ' + userIDGlobal.toString());
  }

  allowPasswordChange(BuildContext context, String email) {
    FutureBuilder(
        future: AuthService().isEmailValid(email),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
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

  getUserID() {
    List<DocumentSnapshot> checkAllProducts = List<DocumentSnapshot>();
    List<String> correctProduct = List<String>();
    FutureBuilder(
        future: db.collection('firestoreUsers').getDocuments(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            checkAllProducts = snapshot.data.documents;
            print(checkAllProducts[0]);
            checkAllProducts.forEach((element) {
              correctProduct.add(element['userID']);
            });
            print('userID svih korisnika:');
            print(correctProduct);
            return null;
          } else
            return null;
        });
  }

  updateUser(User updatedUser, String oldEmail, String text) {}
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class AnonymousViewModel implements AnonymousInterface {
  @override
  Future getAnonymous() async {
    try {
      final FirebaseUser user = (await _auth.signInAnonymously()).user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

// ignore: unused_element
Future<FirebaseUser> _handleAnonymousSignIn() async {
  dynamic result = await auth.getAnonymous();
  return result;
}
