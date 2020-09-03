import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/registerValidation/phoneValidator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdatePhone extends StatefulWidget {
  const UpdatePhone({
    Key key,
    this.user,
  }) : super(key: key);
  final DocumentSnapshot user;

  @override
  _UpdatePhoneState createState() => _UpdatePhoneState();
}

class _UpdatePhoneState extends State<UpdatePhone> {
  @override
  void initState() {
    updateProfilePhoneNumber = widget.user["phoneNumber"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new SizedBox(
        width: double.infinity,
        child: Container(
          child: TextFormField(
            initialValue: updateProfilePhoneNumber == null
                ? updateProfilePhoneNumber = widget.user["phoneNumber"]
                : updateProfilePhoneNumber,
            validator: phoneValidator,
            onChanged: (value) {
              updateProfilePhoneNumber = value;
            },
            autovalidate: false,
            inputFormatters: [
              new BlacklistingTextInputFormatter(
                RegExp(
                    '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
              ),
            ],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20),
              hintText: 'Broj telefona',
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
      ),
    );
  }
}
