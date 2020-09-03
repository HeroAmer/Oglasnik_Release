import 'package:cloud_firestore/cloud_firestore.dart';

/// U sljedecim linijama code-a vidimo logiku koja se zasniva na sljedecem
/// Metoda uniqueBrandsPerCategory prima kao parametar categoryName, a koja
/// je ujedno async metoda, vrsi upit nad bazom i dohvaca neke podatke.
/// Zamisao je da dohvati kolekciju pod imenom products gdje je dokument productCategory
/// jednak polju categoryName i to se smjesta u listu ispod pod nazivom list
uniqueBrandsPerCategory(String categoryName) async {
  var firestore = Firestore.instance;
  QuerySnapshot qn = await firestore
      .collection('products')
      .where('productCategory', isEqualTo: categoryName)
      .getDocuments();

  List<DocumentSnapshot> list = qn.documents;

  /// Kada smo smijestili dohvacene podatke u listu iznad 'list' kreira se nova lista pod imenom uniqueBrands
  /// Daljnja logika se koncipira na tome da prodjemo kroz svaki element u listi 'list' i da smjestamo ["productBrand"]
  /// u listu uniqueBrands te je kasnije returnamo

  List<String> uniqueBrands;
  list.forEach((element) {
    uniqueBrands.add(element["productBrand"]);
  });
  uniqueBrands = uniqueBrands.toSet().toList();
  return uniqueBrands;
}
