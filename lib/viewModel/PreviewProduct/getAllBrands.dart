import 'package:cloud_firestore/cloud_firestore.dart';

///Fahrudin
///
///Funkcija vraca listu naziva svih brand-ova u bazi gdje je svaki string malim slovima napisan
getAllBrands() async {
  final QuerySnapshot productsQuery =
      await Firestore.instance.collection('categoryBrand').getDocuments();

  List<DocumentSnapshot> brandDocument = productsQuery.documents;

  List<String> allBrands = List<String>();

  for (int i = 0; i < brandDocument.length; i++) {
    for (int j = 0; j < brandDocument[i]['brands'].length; j++)
      allBrands.add(brandDocument[i]['brands'][j]);
  }

  for (int i = 0; i < allBrands.length; i++) {
    allBrands[i] = allBrands[i].toString().toLowerCase();
  }

  return allBrands;
}
