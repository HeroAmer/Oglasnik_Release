import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/ProductBrandContainer/productBrandGridView.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/getBrandData.dart';
import 'package:flutter/material.dart';
import 'dart:math';

bool listContains(int n, List<int> listaIntegera) {
  for (var x in listaIntegera) {
    if (n == x) {
      return true;
    }
  }
  return false;
}

FutureBuilder getBrandDataFutureBuilder(String categoryName, int index) {
  return FutureBuilder(
    future: getBrandData(categoryName, categoryBrand[index]),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        //var random = new Random();
        List<int> indexi = List<int>();
        var random = new Random();
        if (snapshot.data.length > 4) {
          do {
            final result = random.nextInt(snapshot.data.length);
            if (!listContains(result, indexi)) indexi.add(result);
          } while (indexi.length < 4);
          return productBrandImages(snapshot, indexi);
        } else {
          for (int i = 0; i < snapshot.data.length; i++) indexi.add(i);
          return productBrandImages(snapshot, indexi);
        }
      } else {
        return Expanded(
          child: Center(
            child: SpinnerCircular(),
          ),
        );
      }
    },
  );
}
