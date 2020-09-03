import 'package:Oglasnik/interface/editProfileInterface.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './editUserViewModel.dart';

class EditData extends ChangePasswordInterface {
  void onPressedSaveButton(BuildContext context) async {
    await EditProfile().isEmailReserved(email);
    if (updateproductNameFormKey.currentState.validate()) {
      userChangedData(context);
    } else
      print('Nemoguce');
  }

  void userChangedData(BuildContext context) {
    db.collection("firestoreUsers").document(userIDGlobal).updateData({
      'fullName': updateProfileName,
      'email': updateProfileEmail,
      'phoneNumber': updateProfilePhoneNumber,
    });

    db.collection("usersEmail").document(email).updateData({
      'fullName': updateProfileName,
      'email': updateProfileEmail,
      'phoneNumber': updateProfilePhoneNumber,
    });
    if (updateProfileEmail != email) {
      myProductList.forEach((element) {
        db.collection('products').document(element).updateData({
          'email': updateProfileEmail,
        });
      });
      userChangedProfile();
      email = updateProfileEmail;
    }
    currentEmail = null;
    allowUsertoUpdateEmail = null;
    Navigator.of(context).pushReplacement(FadeRoute(page: RegisteredHome()));
  }

  void userChangedProfile() {
    db.collection("firestoreUsers").document(userIDGlobal).setData({
      'fullName': updateProfileName,
      'email': updateProfileEmail,
      'password': updateProfilePassword,
      'phoneNumber': updateProfilePhoneNumber,
      'userID': userIDGlobal
    });

    db.collection("usersEmail").document(email).setData({
      'fullName': updateProfileName,
      'email': updateProfileEmail,
      'password': updateProfilePassword,
      'phoneNumber': updateProfilePhoneNumber,
      'userID': userIDGlobal
    });
    email = updateProfileEmail;
  }
}
