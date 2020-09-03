import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';

String confirmpasswordValidator(String value) {
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (value != confirmPasswordChanged) {
    return 'Passwords do not match';
  }
  if (value.length <= 7) {
    print('Password ne smije biti manji od 8 char');
    return 'Password ne smije biti manji od 8 char';
  }
  if (value != newPasswordChanged) {
    print('status poklapanja: ' + nepoklapanje.toString());
    return 'Šifra se ne podudara!';
  }
  return null;
}
