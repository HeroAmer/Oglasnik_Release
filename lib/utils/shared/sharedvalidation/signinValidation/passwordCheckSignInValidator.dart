import 'package:Oglasnik/utils/strings.dart';

String passwordCheckSignIn(String value) {
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (value.length <= 7) {
    return 'Password ne smije biti manji od 8 char';
  }
  if (status == false) {
    return 'Email ili password nisu ispravni';
  } else {
    return null;
  }
}
