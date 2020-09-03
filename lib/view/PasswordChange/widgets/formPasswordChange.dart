import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PasswordChangeTextFields/naslovPromijeniSifru.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PasswordChangeTextFields/novaLozinkaTextField.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PasswordChangeTextFields/potvrdiLozinkuTextField.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PasswordChangeTextFields/unesiKodTextField.dart';
import 'package:Oglasnik/view/PasswordChange/widgets/buttonPasswordChange.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/material.dart';

class FormPasswordChanged extends StatelessWidget {
  const FormPasswordChanged({
    Key key,
    @required this.email,
  }) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 120.0),
            child: PromijeniSifruText(),
          ),
          Form(
            key: passwordChangeFormKey,
            child: Theme(
              data: ThemeData(
                primaryColor: Colors.black54,
                errorColor: Colors.red,
              ),
              child: Column(
                children: <Widget>[
                  UnesiKod(),
                  NovaLozinka(),
                  PovrdiLozinku(),
                  Container(
                    child: AuthService().tokenExistOrNot(context, email, token),
                  ),
                  ButtonSacuvaj(email: email),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
