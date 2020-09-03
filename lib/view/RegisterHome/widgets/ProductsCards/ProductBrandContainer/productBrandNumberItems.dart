import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:flutter/material.dart';

Container productBrandNumberItems(AsyncSnapshot snapshott, int index) {
  return Container(
      width: 150,
      margin: Margin().only(1, 0, 0, 3),
      child: Text('U ovoj kategoriji nalazi se ' +
          snapshott.data.toString() +
          ' ' +
          categoryBrand[index] +
          '.'));
}
