import 'package:cloud_firestore/cloud_firestore.dart';

///Future funkcija pomocu koje izvlačimo proizvode iz baze na osnovu imena branda svakog proizvoda
/// iz kolekcije proizvodi, to storamo u varijablu getBrandData
Future getBrandData(String categoryName, String productBrand) async {
  List slikeBrandova = [];

  /// lista u kojoj cemo storati dole izabrane slikebrandova na osnovu uslova iz if petlje
  final QuerySnapshot getBrandData = await Firestore.instance
      .collection('products')
      .where('productBrand', isEqualTo: productBrand)
      .where('productCategory', isEqualTo: categoryName)
      .where('productFinished', isEqualTo: false)
      .getDocuments();

  /// storamo snapshot brandova iz baze u novu listu brandData, gdje za svaki produkt iz te liste
  /// uzimamo njihov ["productImg1"],["productImg2"],["productImg3"] item(ukoliko ih ima u bazi) i storamo ih u novu listu naziva slikeBrandova
  final List<DocumentSnapshot> brandData = getBrandData.documents;
  brandData.forEach((element) {
    if (element["productImg1"] != null) {
      slikeBrandova.add(element['productImg1']);
    } else if (element["productImg2"] != null) {
      slikeBrandova.add(element['productImg2']);
    } else if (element["productImg3"] != null) {
      slikeBrandova.add(element['productImg3']);
    }
  });

  ///sve dok nam je duzina liste slikaBrandova manja od 4 slike za dati item,
  ///dodajemo drugu sliku u listu; u ovom slucaju (no photo) sliku
  /*while (slikeBrandova.length < 4) {
    slikeBrandova.add(
        'https://firebasestorage.googleapis.com/v0/b/oglasnik-d920b.appspot.com/o/images%2Fnophoto.jpg?alt=media&token=8a6ae209-2839-4707-a1d8-5bf548545e81');
  }*/
  return slikeBrandova;
}
