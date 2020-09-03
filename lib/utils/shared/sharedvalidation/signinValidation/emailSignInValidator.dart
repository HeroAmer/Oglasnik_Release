String emailValidator(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(gmail|hotmail|yahoo|aol|msn|live|outlook)+(\.com)$|@(hotmail|yahoo)+(\.fr|\.co.uk)$|@(orange)+(\.fr)$';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (!regex.hasMatch(value)) {
    return 'Email mora biti validan';
  } else {
    return null;
  }
}
