import 'package:Oglasnik/utils/strings.dart';

String tokenValidator(String value) {
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (tokenstatus == false) {
    return 'Kod nije validan';
  } else if (value.length != 5) {
    return 'Token mora biti dužine 5 karaktera';
  } else
    return null;
}
