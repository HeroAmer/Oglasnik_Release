import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

Column phoneNumberWidget(int index) {
  return Column(
    children: <Widget>[
      Text(
        products[index].phoneNumber == null
            ? 'Korisnik nema broj'
            : products[index].phoneNumber,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      ),
      Text(
        ProductDetailsStrings().callInfoText,
        style: TextStyle(
          //Hexcolor("#95989A"),
          color: phoneNumberTextColor,
          fontWeight: FontWeight.w100,
        ),
      ),
    ],
  );
}
