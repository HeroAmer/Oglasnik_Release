import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:Oglasnik/viewModel/ImageUpload/initValuesOnProductCreated.dart';
import 'package:Oglasnik/viewModel/ImageUpload/uploadImageAndPrintNameCreate.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_string/random_string.dart';

createProductPressed(BuildContext context) async {
  await uploadImageAndPrintNameCreate();
  initValuesOnProductCreated();

  await CreateProduct().createProduct(
    context,
    email,
    phoneNumber,
    productName,
    productID = randomAlphaNumeric(20),
    productCategory,
    productBrand,
    productLocation,
    productTag,
    productDesc,
    productImg1,
    productImg2,
    productImg3,
    productprice,
  );
  myProductList.add(productID);
  createSwitcher = false;
}
