String phoneValidator(String value) {
  Pattern pattern = r'^[0-9]+$';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '') {
    return "Polje ne smije biti prazno";
  }
  if (!regex.hasMatch(value)) {
    return 'Molimo unesite validan broj telefona';
  }
  return null;
}
