import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/oglasTag.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Container itemCardTags(DocumentSnapshot snapshot) {
  return Container(
    width: email == null
        ? SizeConfig.blockSizeHorizontal * 85
        : email != snapshot['email']
            ? SizeConfig.blockSizeHorizontal * 75
            : SizeConfig.blockSizeHorizontal * 85,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: snapshot['productTag']
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
