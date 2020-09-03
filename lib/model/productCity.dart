import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductCity {
  String cityName;
  ProductCity({
    @required this.cityName,
  });
  factory ProductCity.fromDocument(DocumentSnapshot doc) {
    return ProductCity(
      cityName: doc['productLocation'],
    );
  }
}
