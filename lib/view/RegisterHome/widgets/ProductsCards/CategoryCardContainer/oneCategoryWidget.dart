import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/categoryCardRow.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

Column oneCategoryWidget(
    int index, List<String> names, List counts, String categoryName) {
  return Column(children: <Widget>[
    CategoryCardRow(
      icon: Transform.scale(
        scale: 0.8,
        child: SvgPicture.network(categories[index].icon),
      ),
      name: names[0],
      count: counts[0].toString(),
      categoryName: categoryName,
    ),
  ]);
}
