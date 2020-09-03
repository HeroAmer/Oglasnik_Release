import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductCategory {
  String categoryName, icon, categoryID;
  ProductCategory(
      {@required this.categoryName,
      @required this.categoryID,
      @required this.icon});
  factory ProductCategory.fromDocument(DocumentSnapshot doc) {
    return ProductCategory(
      categoryName: doc['categoryName'],
      icon: doc['categoryIcon'],
      categoryID: doc['categoryID'],
    );
  }
}
