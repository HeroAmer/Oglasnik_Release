import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

class PromijeniSifruText extends StatelessWidget {
  const PromijeniSifruText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      PasswordChangePage().columnFirstChild,
      style: TextStyle(
          fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.normal),
    );
  }
}
