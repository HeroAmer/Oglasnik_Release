import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

import 'package:flutter/material.dart';

import 'package:Oglasnik/utils/shared/globalVariables.dart';

Container productDetailsDescWidget(int index) {
  return Container(
    margin: Margin().symmetric(1.8, 5),
    child: Text(
      products[index].productDesc,
      style: TextStyle(
          color: descOfItem,
          fontSize: SizeConfig.blockSizeHorizontal * 4,
          fontWeight: FontWeight.w400),
    ),
  );
}
