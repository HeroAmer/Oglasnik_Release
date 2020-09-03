import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'package:flutter/material.dart';

void itemProductName(BuildContext context, int index, Function setStateParent) {
  Navigator.of(context).push(
    FadeRoute(
      page: ProductDetails(
        productNameScreen: selectedProductsGlobal[index]['productName'],
        productIdScreen: selectedProductsGlobal[index]['productID'],
        setStateParent: null,
      ),
    ),
  );
}
