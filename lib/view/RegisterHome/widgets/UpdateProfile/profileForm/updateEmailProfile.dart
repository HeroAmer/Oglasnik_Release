import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/registerValidation/emailRegisterCheckValidator.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateEmail extends StatefulWidget {
  const UpdateEmail({
    Key key,
    this.user,
  }) : super(key: key);
  final DocumentSnapshot user;

  @override
  _UpdateEmailState createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> {
  @override
  void initState() {
    updateProfileEmail = email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthService().userExistingorNot(updateProfileEmail);
    return Container(
      margin: Margin().only(0, 1, 0, 0),
      child: new SizedBox(
        width: double.infinity,
        child: Container(
          child: TextFormField(
            initialValue: updateProfileEmail == null
                ? updateProfileEmail = email
                : updateProfileEmail,
            validator: emailUpdateCheck,
            autovalidate: false,
            onChanged: (value) {
              updateProfileEmail = value;
            },
            decoration: InputDecoration(
              hintText: 'Email',
              contentPadding: EdgeInsets.only(left: 20),
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
        ),
      ),
    );
  }
}
