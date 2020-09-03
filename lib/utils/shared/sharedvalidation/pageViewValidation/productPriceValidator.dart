String productPriceValidator(String value) {
  Pattern pattern = r'^(\d{1,6}|\d{0,6}[\,\.]\d{1,2})$';
  RegExp regex = new RegExp(pattern);
  if (value.length == null || value == '') {
    return "Polje ne smije biti prazno";
  } else if (!regex.hasMatch(value)) {
    return 'Neispravan unos';
  }
  return null;
}
