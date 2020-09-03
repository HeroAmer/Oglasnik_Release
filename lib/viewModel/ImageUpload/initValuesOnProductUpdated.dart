import 'package:Oglasnik/utils/shared/globalVariables.dart';

void initValuesOnProductUpdated() {
  //loadingGlob = true;
  createdGlob = true;
  azurload = true;
  productName = updateProductNameReturn == null
      ? updateProductName
      : updateProductNameReturn;
  productCategory = updateDropdownValueCategory;
  productBrand = updateDropdownValueBrand;
  productLocation = updateDropdownValueCity;
  productTag = updateProductTagsReturn == null
      ? updateProductTags
      : updateProductTagsReturn;
  productDesc = updateProductDescriptionReturn == null
      ? updateProductDescription
      : updateProductDescriptionReturn;
  productprice = updateProductPriceReturn == null
      ? updateProductPrice
      : updateProductPriceReturn;
}
