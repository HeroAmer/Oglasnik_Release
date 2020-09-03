import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/categoryCardRow.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

Column threeCategoriesWidget(
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
    CategoryCardRow(
      icon: Transform.scale(
        scale: 0.8,
        child: SvgPicture.network(categories[index].icon),
      ),
      name: names[1],
      count: counts[1].toString(),
      categoryName: categoryName,
    ),
    CategoryCardRow(
      icon: Transform.scale(
        scale: 0.8,
        child: SvgPicture.network(categories[index].icon),
      ),
      name: names[2],
      count: counts[2].toString(),
      categoryName: categoryName,
    ),
  ]);
}
