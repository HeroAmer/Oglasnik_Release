import 'package:Oglasnik/model/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductInterface {
  Future createProduct(
      BuildContext context,
      String email,
      phoneNumber,
      productName,
      productID,
      productCategory,
      productBrand,
      productLocation,
      productTag,
      productDesc,
      productImg1,
      productImg2,
      productImg3,
      productCijena);
}

abstract class UpdateProductInterface {
  Future updateProduct(String productID, String productName);
}

abstract class AddFavoriteProductInterface {
  Future addFavorite(String email, DocumentSnapshot product, String userID);
  Future removeFavorite(String email, DocumentSnapshot product, String userID);
  Future isProductFavorite(Product product);
}

abstract class ReadProductInterface {
  Future getProducts();
  List<DocumentSnapshot> addAdditionalBrandProducts(String brandName);
}

abstract class ReadCategoriesInterface {
  Future getCategories();
}

abstract class ReadBrandInterface {
  Future getBrandsByCategories(String categoryName);
}

abstract class ReadCitiesInterface {
  Future getCitiesFromProducts();
}

abstract class ProductDetailsInterface {
  void onUpdatePressed(BuildContext context, int index);
}
