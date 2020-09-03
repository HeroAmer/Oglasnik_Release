import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';

String imageName(String imgURL) {
  return imgURL.substring(82, imgURL.indexOf('?alt=media'));
}

void initUpdatedValues(Product productSnapshot) {
  updateProductName = productSnapshot.productName;
  updateProductPrice = productSnapshot.productCijena;
  updateProductTags = productSnapshot.productTag;
  updateProductDescription = productSnapshot.productDesc;
  updateDropdownValueCategory = productSnapshot.productCategory;
  updateDropdownValueBrand = productSnapshot.productBrand;
  updateDropdownValueCity = productSnapshot.productLocation;
  productImg1Update = productSnapshot.productImg1;
  productImg2Update = productSnapshot.productImg2;
  productImg3Update = productSnapshot.productImg3;

  if (productSnapshot.productImg1 != null)
    image1Name = imageName(productSnapshot.productImg1);
  if (productSnapshot.productImg2 != null)
    image2Name = imageName(productSnapshot.productImg2);
  if (productSnapshot.productImg3 != null)
    image3Name = imageName(productSnapshot.productImg3);
}
