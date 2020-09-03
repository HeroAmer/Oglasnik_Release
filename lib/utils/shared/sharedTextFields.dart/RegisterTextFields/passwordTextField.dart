import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/tokenandpassValidation/passValidator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        new BlacklistingTextInputFormatter(
          RegExp(
              '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        ),
      ],
      decoration: InputDecoration(
        labelStyle: TextStyle(),
        hintText: 'Lozinka',
        contentPadding: EdgeInsets.only(left: 20),
      ),

      initialValue: registerPassword,
      onChanged: (value) => registerPassword = value,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      textInputAction: TextInputAction.next,
      //  focusNode: lozinkanode,
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },

      validator: passwordValidator,
    );
  }
}

Container passwordInputField(BuildContext context) {
  return new Container(
    margin: EdgeInsets.only(bottom: 10),
    child: new SizedBox(
      width: double.infinity,
      child: Container(
        child: PasswordTextField(),
      ),
    ),
  );
}
