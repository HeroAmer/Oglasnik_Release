import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:mailgun/mailgun.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var mailgun = MailgunMailer(
  domain: DotEnv().env['MAILGUN_DOMAIN'],
  apiKey: DotEnv().env['MAILGUN_APIKEY'],
);

Future<void> sendemail(String token) async {
  var response = await mailgun.send(
      from: 'oglasnik.official@gmail.com',
      to: [forgetEmail],
      subject: "Zaboravili ste lozinku? ",
      text: "Token za resetovanje lozinke je: " + token);
  print(response.status);
  print(response.message);
}

Future<void> sendemail3() async {
  var response = await mailgun.send(
    from: 'fcidicwebmail@gmail.com',
    to: [forgetEmail], // provjeriti jel ovo okay
    subject: "Test email",
    template: "prvitemplate",
    // options: {
    //   'template_variables': {'tokenCode': tokenCode}
    // },
  );
  print(response.status);
  print(response.message);
}
