import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

import 'package:flutter/material.dart';

Container productBrandTitle(BuildContext context, int index) {
  return Container(
    margin: Margin().only(2, 0, 0, 3),
    child: Material(
      color: Colors.transparent,
      child: Text(
        categoryBrand[index],
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 5,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
