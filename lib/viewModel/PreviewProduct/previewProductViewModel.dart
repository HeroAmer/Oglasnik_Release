import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// asynhrona funkcija koja povlači sve kategorije iz baze te sprema
///  u listu ime kategorija da bi ih kasnije mogli ispisati
void initCategoryNames() async {
  final QuerySnapshot categoryQuery =
      await Firestore.instance.collection('category').getDocuments();
  final List<DocumentSnapshot> documents = categoryQuery.documents;
  documents.forEach((element) {
    categoryNames.add(element["categoryName"]);
  });

  categoryNames.sort();
}

///funkcija koja povlaci iz baze produkte iz kolekcije kategorija na osnovu unikatnog id-a
///svakog proizvoda
Future<String> returnCategoryName(String id) async {
  final QuerySnapshot categoryNameQuery = await Firestore.instance
      .collection('category')
      .where('categoryID', isEqualTo: id)
      .limit(1)
      .getDocuments();

  ///storanje i ispisivanje imena kategorija
  final List<DocumentSnapshot> documents = categoryNameQuery.documents;
  String s;
  documents.forEach((element) => s = element["categoryName"]);
  return s;
}

Future getMyProducts() async {
  final QuerySnapshot myProducts = await Firestore.instance
      .collection('firestoreUsers')
      .document(userIDGlobal)
      .collection('myProducts')
      .getDocuments();
  List<DocumentSnapshot> productList = myProducts.documents;

  return productList;
}

Future getAllUsers() async {
  final QuerySnapshot myUsers =
      await Firestore.instance.collection('firestoreUsers').getDocuments();
  List<DocumentSnapshot> usersList = myUsers.documents;
  print('documentSnapshot');
  print(usersList[0]['userID']);
  return usersList;
}
