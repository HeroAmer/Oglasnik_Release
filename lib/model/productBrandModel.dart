import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductBrand {
  String categoryName, categoryID, categoryBrandID;
  List<String> brands;
  ProductBrand(
      {@required this.categoryName,
      @required this.categoryID,
      @required this.brands,
      this.categoryBrandID});

  factory ProductBrand.fromDocument(DocumentSnapshot doc) {
    return ProductBrand(
      categoryName: doc['categoryName'],
      categoryID: doc['categoryID'],
      brands: List.from(doc['brands']),
      categoryBrandID: doc['categoryBrandID'],
    );
  }
}
