import 'package:Oglasnik/utils/strings.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

///Faruk Cidic
///
///Bellow is a widget that is called on main(categoryScreen) just for getting all products from db
///Later on, we are storing all products in a list type [DocumentSnapshot] but since we are doing this
///because of [Search suggestion], we are in need for list of String. So bellow, we are converting
///products from one list to the right one.
///
///
List<DocumentSnapshot> allProductsObject = List<DocumentSnapshot>();

class ProductSearchDB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firestore.instance
          .collection('products')
          .where('productFinished', isEqualTo: false)
          .getDocuments(),
      builder: (BuildContext context, AsyncSnapshot snapshott) {
        if (snapshott.hasData) {
          productsForSearch.clear();
          allProductsObject.clear();
          allProductsObject = snapshott.data.documents;

          allProductsObject.forEach((element) {
            productsForSearch.add(element['productName']);
          });

          return Container();
        } else {
          return Container();
        }
      },
    );
  }
}

///Faruk
///
///ukoliko želimo postaviti sva slova u jednom stringu UPPERCASE, tom stringu je dovoljno pozvati
///[allInCaps] a ukoliko pak želimo samo prvo slovo postaviti velikim, onda je [inCaps] dovoljno pozvati
///
extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
}

void suggestionLogic(List<String> productsAndBrandList, String query) {
  suggestionsList = productsAndBrandList
      .where((e) => e.toLowerCase().startsWith(query.toLowerCase()))
      .toList();
}
