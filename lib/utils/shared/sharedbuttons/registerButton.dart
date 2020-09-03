import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/viewModel/Register/registerViewModel.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/strings.dart';

String fullNameRegister, emailRegister, passwordRegister, phoneNumberRegister;

SizedBox registerButton(BuildContext context) {
  return button(
    AppLabelsAuth().registracija,
    () {
      allowAutoValidate = true;

      onPressedRegister(context, fullNameRegister, emailRegister,
          passwordRegister, phoneNumberRegister);
    },
  );
}
