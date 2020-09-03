import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/PasswordChange/widgets/formPasswordChange.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordChange extends StatefulWidget {
  String email;
  PasswordChange(this.email);
  @override
  _PasswordChangeState createState() => _PasswordChangeState(email);
}

class _PasswordChangeState extends State<PasswordChange> {
  final db = Firestore.instance;
  FirebaseUser user;
  @override
  void dispose() {
    super.dispose();
  }

  initState() {
    cleanPasswordChanged();
    super.initState();
  }

  String email;
  _PasswordChangeState(this.email);
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
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
          leading: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {
                Navigator.of(context).pop(FadeRoute());
              }),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: FormPasswordChanged(email: email),
          ),
        ),
      ),
    );
  }
}
