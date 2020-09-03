import 'package:Oglasnik/interface/productInterface.dart';
import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/PostScreens/pages/articlePage.dart';
import 'package:Oglasnik/viewModel/ImageUpload/resetGlobalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewModel extends ProductDetailsInterface {
  @override
  void onUpdatePressed(BuildContext context, int index) {
    createSwitcher = false;
    resetGlobalVariables();
    updateProductNameReturn = null;
    updateProductDescriptionReturn = null;
    updateProductPriceReturn = null;
    updateProductTagsReturn = null;
    Navigator.of(context).push(
      FadeRoute(
        page: ArticlePage(
          editProduct: UserProducts().editProduct,
          productSnapshot: products[index],
          productID: products[index].productID,
        ),
      ),
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  void initImageSlider(AsyncSnapshot snapshot, List imageSlider) {
    products = snapshot.data.documents
        .map((doc) => Product.fromDocument(doc))
        .toList();
    if (products[0].productImg1 != null) {
      imageSlider.add(products[0].productImg1);
    }
    if (products[0].productImg2 != null) {
      imageSlider.add(products[0].productImg2);
    }
    if (products[0].productImg3 != null) {
      imageSlider.add(products[0].productImg3);
    }
    if (imageSlider.length == 0) {
      imageSlider.add("assets/images/nophoto.jpg");
    }
  }
}
