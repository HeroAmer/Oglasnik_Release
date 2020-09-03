import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';

import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/strings.dart';

import 'package:Oglasnik/utils/shared/globalVariables.dart';

import 'package:hexcolor/hexcolor.dart';

Container phoneNumberButtonWidget(int index) {
  return Container(
    margin: Margin().only(1.7, 1.7, 0, 8),
    decoration: BoxDecoration(
        border: Border.all(color: Hexcolor("#95989A")),
        borderRadius: BorderRadius.all(Radius.circular(0))),
    child: FlatButton(
      onPressed: () =>
          CallsAndMessagesService().call(products[index].phoneNumber),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
      color: mainAppColor,
      child: Text(
        ProductDetailsStrings().callText,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
