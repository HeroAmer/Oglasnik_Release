import 'package:Oglasnik/interface/productInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utils/shared/globalVariables.dart';
import '../../view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductWidgets/itemProductContainer.dart';

///Future function that takes all product from db and it's used in a Future Builder
///for listing(showing) all products once when user cancel his Search in App.
///
class ProductViewModel implements ReadProductInterface {
  @override
  Future getProducts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('products')
        .where('productFinished', isEqualTo: false)
        .getDocuments();

    List<DocumentSnapshot> prods = qn.documents;
    return prods;
  }

  List<DocumentSnapshot> addAdditionalBrandProducts(String brandName) {
    List<DocumentSnapshot> forReturn = List<DocumentSnapshot>();
    for (int i = 0; i < allProducts.length; i++) {
      if ((allProducts[i]['productBrand'].toString().toLowerCase() ==
              brandName) &&
          !selectedProductsGlobal.contains(allProducts[i])) {
        //if (productList[i]['productName'].toString().toLowerCase().contains(brandName))
        forReturn.add(allProducts[i]);
      }
    }
    return forReturn;
  }
}
