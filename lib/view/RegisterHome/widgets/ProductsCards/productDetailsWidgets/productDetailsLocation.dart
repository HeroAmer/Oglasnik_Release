import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsPrice.dart';

import 'package:flutter/material.dart';

import 'package:Oglasnik/utils/shared/globalVariables.dart';

Container productDetailsLocationWidget(int index) {
  return Container(
    margin: Margin().symmetric(1, 3),
    child: Row(
      children: <Widget>[
        Container(child: Icon(Icons.location_on)),
        Text(
          products[index].productLocation,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Spacer(),
        productDetailsPriceWidget(index),
      ],
    ),
  );
}
