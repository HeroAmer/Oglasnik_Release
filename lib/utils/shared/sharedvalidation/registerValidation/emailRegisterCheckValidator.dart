import 'package:Oglasnik/utils/strings.dart';

// ignore: missing_return
String emailRegisterCheck(String value) {
  bool smislen = false;
  bool dodatni = false;
  Pattern newpattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(?!hotmail)(?!hotmil)(?!hotail)(?!htmail)(?!hotmails)(?!hotmailz)(?!hotmai)(?!otmail)(?!hotmsil)(?!hotmakl)(?!hotmails)(?!hotamil)(?!gmail)(?!gmsil)(?!gail)(?!gmal)(?!gmai)(?!yahoo)(?!yaho)(?!yah)(?!msn)(?!msm)(?!man)(?!live)(?!liv)(?!live)(?!livr)(?!luve)(?!live)(?!outlook)(?!outlok)(?!ouutlook)(?!outloo)(?!aol)(?!ail)((\[[0-9]{1,3}\.[-9]{1,3}.[-9]{1u,3}\.[-9]{1,3}\[0-9]{1,0-9]i1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9])+(\.com|\.ba|\.edu.ba|\.edu|\.hr|\.rs|\.org|\.fr|\.net|\.co.uk|\.co)))$';
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(gmail|hotmail|yahoo|aol|msn|live|outlook)+(\.com)$|@(hotmail|yahoo)+(\.fr|\.co.uk)$|@(orange)+(\.fr)$';
  RegExp regex = new RegExp(pattern);
  RegExp newregex = new RegExp(newpattern);
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (allowUserToRegister) {
    if (newregex.hasMatch(value)) {
      smislen = true;
    }

    if (regex.hasMatch(value)) {
      dodatni = true;
    }

    if (smislen == false) {
      if (dodatni == true) {
        smislen = false;
        dodatni = false;
        return null;
      } else {
        smislen = false;
        dodatni = false;
        return 'Email nije validan';
      }
    }

    if (smislen == true && dodatni == false) {
      smislen = false;
      dodatni = false;
      return null;
    }
    if (smislen == true) {
      if (dodatni == true) {
        smislen = false;
        dodatni = false;
        return null;
      } else {
        smislen = false;
        dodatni = false;
        return 'Email nije validan';
      }
    }
  } else
    return 'Email se već koristi';
}

// ignore: missing_return
String emailUpdateCheck(String value) {
  bool smislen = false;
  bool dodatni = false;
  Pattern newpattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(?!hotmail)(?!hotmil)(?!hotail)(?!htmail)(?!hotmails)(?!hotmailz)(?!hotmai)(?!otmail)(?!hotmsil)(?!hotmakl)(?!hotmails)(?!hotamil)(?!gmail)(?!gmsil)(?!gail)(?!gmal)(?!gmai)(?!yahoo)(?!yaho)(?!yah)(?!msn)(?!msm)(?!man)(?!live)(?!liv)(?!live)(?!livr)(?!luve)(?!live)(?!outlook)(?!outlok)(?!ouutlook)(?!outloo)(?!aol)(?!ail)((\[[0-9]{1,3}\.[-9]{1,3}.[-9]{1u,3}\.[-9]{1,3}\[0-9]{1,0-9]i1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9])+(\.com|\.ba|\.edu.ba|\.edu|\.hr|\.rs|\.org|\.fr|\.net|\.co.uk|\.co)))$';
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(gmail|hotmail|yahoo|aol|msn|live|outlook)+(\.com)$|@(hotmail|yahoo)+(\.fr|\.co.uk)$|@(orange)+(\.fr)$';
  RegExp regex = new RegExp(pattern);
  RegExp newregex = new RegExp(newpattern);
  if (value.length == null || value == '') return 'Polje ne smije biti prazno';
  if (allowUsertoUpdateEmail) { 
    if (newregex.hasMatch(value)) {
      smislen = true;
    }

    if (regex.hasMatch(value)) {
      dodatni = true;
    }

    if (smislen == false) {
      if (dodatni == true) {
        smislen = false;
        dodatni = false;
        return null;
      } else {
        smislen = false;
        dodatni = false;
        return 'Email nije validan';
      }
    }

    if (smislen == true && dodatni == false) {
      smislen = false;
      dodatni = false;
      return null;
    }
    if (smislen == true) {
      if (dodatni == true) {
        smislen = false;
        dodatni = false;
        return null;
      } else {
        smislen = false;
        dodatni = false;
        return 'Email nije validan';
      }
    }
  } else
    return 'Neispravan unos ili se email već koristi';
}

// allowUsertoUpdateEmail || currentEmail
