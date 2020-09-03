import 'package:flutter/material.dart';

import 'package:Oglasnik/utils/shared/globalVariables.dart';

Container productDetailsCategoryWidget(int index) {
  return Container(
    child: Text(
      //ProductDetailsStrings().categoryName
      products[index].productCategory,
    ),
  );
}
