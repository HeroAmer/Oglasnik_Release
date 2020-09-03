import 'package:Oglasnik/utils/strings.dart';

String emailCheckSignIn(String value) {
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';

  if (status == false) {
    return 'Email ili password nisu ispravni';
  } else {
    return null;
  }
}
