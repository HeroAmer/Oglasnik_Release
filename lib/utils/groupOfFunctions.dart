import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'shared/globalVariables.dart';

cleanRegister() {
  registerFullName = null;
  registerPassword = null;
  registerPhoneNumber = null;
  registerEmail = null;
}

cleanSignIn() {
  signInEmail = null;
  signInPassword = null;
}

cleanAlertDialog() {
  forgetEmail = null;
}

cleanPasswordChanged() {
  passwordChangedToken = null;
  newPasswordChanged = null;
  confirmPasswordChanged = null;
}

dropDownInitialValueState() {
  dropdownValueCategory = "Automobili";
  dropdownValueBrand = "Audi";
  dropdownValueCity = 'Sarajevo';
  buttonOne = false;
  buttonTwo = false;
  buttonThree = false;
}
