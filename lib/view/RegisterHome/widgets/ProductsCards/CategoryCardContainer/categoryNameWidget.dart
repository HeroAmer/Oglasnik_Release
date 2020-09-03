import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryCard.dart';

import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

Container categoryNameWidget(int index) {
  return Container(
    margin: Margin().only(1, 0, 0, 0),
    child: Text(
      categories[index].categoryName,
      style: TextStyle(
        fontSize: SizeConfig.safeBlockHorizontal * 5,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
