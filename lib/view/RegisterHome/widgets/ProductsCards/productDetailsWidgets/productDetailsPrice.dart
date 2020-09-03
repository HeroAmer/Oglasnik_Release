import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

import 'package:intl/intl.dart';

Container productDetailsPriceWidget(int index) {
  return Container(
    margin: Margin().only(1, 0, 0, 0),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.white,
      border: Border.all(color: mainAppColor),
    ),
    child: Text(
        NumberFormat.currency(locale: 'eu', symbol: 'KM').format(
          (double.parse(
              '${(products[index].productCijena).toString().replaceAll(',', '.')}')),
        ),
        style: TextStyle(fontWeight: FontWeight.w500)),
  );
}
