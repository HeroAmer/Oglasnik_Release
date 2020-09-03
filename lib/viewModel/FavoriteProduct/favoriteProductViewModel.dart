import 'package:Oglasnik/interface/productInterface.dart';
import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoriteProduct extends AddFavoriteProductInterface {
  @override
  Future addFavorite(String email, DocumentSnapshot product, String userID) {
    db
        .collection("firestoreUsers")
        .document(userID)
        .collection('savedProducts')
        .document(product["productID"])
        .setData({
      'productID': product["productID"],
    });
    return null;
  }

  Future getAllFavoritesIDs() async {
    final QuerySnapshot favorites = await Firestore.instance
        .collection('firestoreUsers')
        .document(userIDGlobal)
        .collection('savedProducts')
        .getDocuments();
    List<DocumentSnapshot> favoritesDocs = favorites.documents;
    return favoritesDocs;
  }

  Future removeFavorite(String email, DocumentSnapshot product, String userID) {
    db
        .collection("firestoreUsers")
        .document(userID)
        .collection('savedProducts')
        .document(product["productID"])
        .delete();

    return null;
  }

  Future isProductFavorite(Product product) async {
    List<DocumentSnapshot> allFavs = await getAllFavoritesIDs();

    for (final x in allFavs) {
      if (product.productID == x['productID']) return true;
    }

    return false;
  }

  Future getAllUnfinishedProducts() async {
    final QuerySnapshot favoritesProducts = await Firestore.instance
        .collection('products')
        .where('productFinished', isEqualTo: false)
        .getDocuments();
    List<DocumentSnapshot> productsDocs = favoritesProducts.documents;
    return productsDocs;
  }

  Future listAllFavorites() async {
    List<DocumentSnapshot> favsIDs = await getAllFavoritesIDs();
    List<DocumentSnapshot> allProds = await getAllUnfinishedProducts();
    List<DocumentSnapshot> retList = List<DocumentSnapshot>();

    for (int i = 0; i < favsIDs.length; i++) {
      for (int j = 0; j < allProds.length; j++) {
        if (favsIDs[i]['productID'] == allProds[j]['productID']) {
          retList.add(allProds[j]);
          break;
        }
      }
    }
    return retList;
  }

  addOrRemoveFavorite(index, setStateParent, container) async {
    final result = favoritesList.contains(container[index]['productID']);
    if (result) {
      favoritesList.remove(container[index]['productID']);
      await FavoriteProduct()
          .removeFavorite(email, container[index], userIDGlobal);
      setStateParent();
    } else {
      favoritesList.add(container[index]['productID']);
      await FavoriteProduct()
          .addFavorite(email, container[index], userIDGlobal);
      setStateParent();
    }
  }
}

void onTapFavorites(BuildContext context, AsyncSnapshot snapshot, int index,
    Function setStateParent) {
  Navigator.of(context).push(
    FadeRoute(
      page: ProductDetails(
        productNameScreen: snapshot.data[index]['productName'],
        productIdScreen: snapshot.data[index]['productID'],
        setStateParent: setStateParent,
      ),
    ),
  );
}
