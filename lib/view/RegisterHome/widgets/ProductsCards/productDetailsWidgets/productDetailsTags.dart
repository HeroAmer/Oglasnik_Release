import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/oglasTag.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

Container productDetailsTagsWidget(int index) {
  return Container(
    width: email != products[index].email
        ? SizeConfig.blockSizeHorizontal * 75
        : SizeConfig.blockSizeHorizontal * 85,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: Margin().symmetric(0, 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
    ),
  );
}
