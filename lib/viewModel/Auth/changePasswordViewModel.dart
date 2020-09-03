import 'dart:async';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/material.dart';

  void changePasswordButton(BuildContext context) {
    newPassword = newPasswordChanged;
    passwordConfirm = confirmPasswordChanged;
    token = passwordChangedToken;
    AuthService().tokenExistOrNot(context, email, token);
    print('Nakon klika sačuvaj - ispis je sljedeći:');
    Timer(Duration(milliseconds: 500), () {
      AuthService().onPressedChangePassword(
        context,
        email,
        newPasswordChanged,
        confirmPasswordChanged,
        token,
      );
    });
  }
