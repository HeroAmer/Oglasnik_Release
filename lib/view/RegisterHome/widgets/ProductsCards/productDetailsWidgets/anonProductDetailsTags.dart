import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/oglasTag.dart';

import 'package:flutter/material.dart';

import 'package:Oglasnik/utils/shared/globalVariables.dart';

SingleChildScrollView anonProductDetailsTagsWidget(int index) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
      margin: Margin().symmetric(0, 1),
      child: Row(
        children: products[index]
            .productTag
            .split(',')
            .map<Widget>(
              (element) => element.trim().length > 0
                  ? new OglasTag(naziv: element)
                  : Container(),
            )
            .toList(),
      ),
    ),
  );
}
