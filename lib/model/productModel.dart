import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Product {
  String productName,
      email,
      phoneNumber,
      productID,
      productCategory,
      productBrand,
      productLocation,
      productTag,
      productDesc,
      productImg1,
      productImg2,
      productImg3,
      productCijena;
      bool productFinished = false;
  Product(
      {@required this.productBrand,
      @required this.productCategory,
      @required this.productCijena,
      @required this.productID,
      @required this.productLocation,
      @required this.productName,
      this.phoneNumber,
      this.productDesc,
      this.email,
      this.productImg1,
      this.productImg2,
      this.productImg3,
      this.productFinished,
      this.productTag});

  factory Product.fromDocument(DocumentSnapshot doc) {
    return Product(
      productName: doc['productName'],
      email: doc['email'],
      phoneNumber: doc['phoneNumber'],
      productBrand: doc['productBrand'],
      productCategory: doc['productCategory'],
      productCijena: doc['cijena'],
      productID: doc['productID'],
      productLocation: doc['productLocation'],
      productDesc: doc['productDesc'],
      productTag: doc['productTag'],
      productFinished: doc['productFinished'],
      productImg1: doc['productImg1'],
      productImg2: doc['productImg2'],
      productImg3: doc['productImg3'],
    );
  }
}
