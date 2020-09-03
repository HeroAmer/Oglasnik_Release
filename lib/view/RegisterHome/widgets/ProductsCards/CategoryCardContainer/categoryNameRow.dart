import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productBrandCard.dart';

import 'package:flutter/material.dart';

import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/CategoryCardContainer/categoryNameWidget.dart';

InkWell categoryNameRow(BuildContext context, int index) {
  return InkWell(
    splashColor: Colors.transparent,
    onTap: () {
      Navigator.of(context).push(
        FadeRoute(
          page: ProductBrandCard(
            categoryName: categories[index].categoryName,
          ),
        ),
      );
    },
    child: Align(
      alignment: Alignment.topCenter,
      child: categoryNameWidget(index),
    ),
  );
}
