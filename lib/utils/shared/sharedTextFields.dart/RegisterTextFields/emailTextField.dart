import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/registerValidation/emailRegisterCheckValidator.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.only(left: 20),
      ),

      //keyboardType: TextInputType.emailAddress,
      initialValue: registerEmail,
      onChanged: (value) => registerEmail = value,
      keyboardType: TextInputType.visiblePassword,
      validator: emailRegisterCheck,
      textInputAction: TextInputAction.next,
      //  focusNode: emailnode,
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
    );
  }
}

Container emailInputField(BuildContext context) {
  return new Container(
    margin: EdgeInsets.only(bottom: 10),
    child: new SizedBox(
      width: double.infinity,
      child: Container(
        child: EmailTextField(),
      ),
    ),
  );
}
