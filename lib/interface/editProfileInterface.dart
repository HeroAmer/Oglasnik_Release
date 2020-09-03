import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class UpdateProfileInterface {
  Future<List<DocumentSnapshot>> getCurrentUserInfo(String email);
  Future<bool> isEmailReserved(String email);
  Future<QuerySnapshot> getUsersFromdb();
}

abstract class ChangePasswordInterface {
  onPressedSaveButton(BuildContext context);
  userChangedData(BuildContext context);
  userChangedProfile();
}
