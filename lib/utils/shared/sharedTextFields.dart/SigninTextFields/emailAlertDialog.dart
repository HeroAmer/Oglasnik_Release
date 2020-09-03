import 'package:Oglasnik/utils/shared/sharedvalidation/signinValidation/emailAlertDialogValidator.dart';
import 'package:flutter/material.dart';

import '../../globalVariables.dart';

class EmailAlertDialog extends StatelessWidget {
  const EmailAlertDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.only(left: 10),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: emailAlertDialogValidation,
      initialValue: forgetEmail,
      onChanged: (value) {
        forgetEmail = value;
      },
    );
  }
}
