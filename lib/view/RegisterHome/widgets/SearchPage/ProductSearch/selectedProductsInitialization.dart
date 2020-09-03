import '../../../../../utils/shared/globalVariables.dart';
import 'itemProductWidgets/itemProductContainer.dart';

void initSelectedProducts(String query) {
  selectedProductsGlobal.clear();

  allProducts.forEach((element) {
    if (((element['productName']
                .toLowerCase()
                .toString()
                .startsWith(query.toLowerCase() + ' ')) ||
            (element['productName']
                .toLowerCase()
                .toString()
                .endsWith(' ' + query.toLowerCase())) ||
            element['productName']
                .toLowerCase()
                .contains(' ' + query.toLowerCase() + ' ') ||
            element['productName'].toString().toLowerCase() ==
                query.toLowerCase()) &&
        !selectedProductsGlobal.contains(element))
      selectedProductsGlobal.add(element);
  });
}
