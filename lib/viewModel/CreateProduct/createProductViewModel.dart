import 'dart:async';

import 'package:Oglasnik/interface/productInterface.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/PostScreens/pages/articlePage.dart';
import 'package:Oglasnik/viewModel/ImageUpload/resetGlobalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Class that is used for creating products in Firestore
///Method createProduct is called once when user click 'Završi' button
class CreateProduct extends ProductInterface {
  @override
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
      productCijena) {
    db.collection("products").document(productID).setData({
      'productID': productID,
      'email': email,
      'phoneNumber': phoneNumber,
      'productName': productName,
      'productCategory': productCategory,
      'productBrand': productBrand,
      'productLocation': productLocation,
      'cijena': productCijena,
      'productTag': productTag,
      'productFinished': false,
      'productDesc': productDesc,
      'productImg1': productImg1,
      'productImg2': productImg2,
      'productImg3': productImg3,
    });

    db
        .collection("firestoreUsers")
        .document(userIDGlobal)
        .collection('myProducts')
        .document(productID)
        .setData({
      'productID': productID,
    });

    return null;
  }

  Future updateProduct(
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
      productCijena) {
    db.collection("products").document(productID).updateData({
      'productID': productID,
      'email': email,
      'phoneNumber': phoneNumber,
      'productName': productName,
      'productCategory': productCategory,
      'productBrand': productBrand,
      'productLocation': productLocation,
      'cijena': productCijena,
      'productTag': productTag,
      //  'productFinished': false,
      'productDesc': productDesc,
      'productImg1': productImg1,
      'productImg2': productImg2,
      'productImg3': productImg3,
    });
    return null;
  }

  void proceedToNextPage(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    Timer(Duration(milliseconds: 500), () {
      pageController.nextPage(
          duration: Duration(milliseconds: 800), curve: Curves.ease);
    });
  }
}

class UpdateProduct extends UpdateProductInterface {
  @override
  Future updateProduct(String productID, String productName) {
    print('productID je: ' + productID.toString());
    db.collection("products").document(productID).updateData({
      'productFinished': true,
    });
    db
        .collection("firestoreUsers")
        .document(userIDGlobal)
        .collection('myProducts')
        .document(productID)
        .delete();
    return null;
  }
}

void noviOglasButton(BuildContext context) {
  newProductNameReturn = null;
  newProductTagsReturn = null;
  newProductDescriptionReturn = null;
  newProductPriceReturn = null;
  image1Name = null;
  image2Name = null;
  image3Name = null;
  resetGlobalVariables();
  createSwitcher = true;
  azurload = false;
  Navigator.of(context).pushReplacement(
    FadeRoute(
      page: ArticlePage(
        editProduct: UserProducts().newProduct,
        productSnapshot: null,
        productID: null,
      ),
    ),
  );
}

void nazivFieldOnChanged(value) {
  if (!createSwitcher)
    updateProductNameReturn = value;
  else
    newProductNameReturn = value;
}

void opisFieldOnChanged(value) {
  if (!createSwitcher)
    updateProductDescriptionReturn = value;
  else
    newProductDescriptionReturn = value;
}

void oznakeFieldOnChanged(value) {
  if (!createSwitcher)
    updateProductTagsReturn = value;
  else
    newProductTagsReturn = value;
}
