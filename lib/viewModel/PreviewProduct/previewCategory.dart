import 'package:Oglasnik/interface/productInterface.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// funkcija koja za proslijedjeni string vraca widget Image.asset na osnovu tog stringa
Image buildImageWidget(String imagePath) {
  return Image.asset(imagePath);
}

/// Funkcija ce sluziti za ispis svih kategorija u category karticama u kojima ima proizvoda u bazi.
/// Na pocetku povlacimo sve dokumente iz kolekcije category iz Firestore-a i smjestamo ih u lokalnu listu. Takodjer povlacimo
/// i sve produkte iz baze i smjestamo ih u lokalnu varijablu. Potom produkte sortiramo prema nazivu kategorije i izbacujemo
/// sve duplikate (u odnosu na naziv kategorije). Sada samo dvjema petljama prolazimo kroz liste dokumenata kategorija
/// i produkata te gledamo da li za neku kategoriju iz kolekcije categories postoji neki proizvod u bazi. U slucaju
/// da postoji zapamticemo tu kategoriju (njen dokument koji cine naziv, ikona, brand-ovi itd.) i listu tih kategorija
/// cemo vratiti iz funkcije.
class CategoryViewModel implements ReadCategoriesInterface {
  @override
  getCategories() async {
    ///povlacimo sve kategorije iz baze
    var firestore = Firestore.instance;
    QuerySnapshot queryCategories =
        await firestore.collection('category').getDocuments();

    List<DocumentSnapshot> cats = queryCategories.documents;

    List<DocumentSnapshot> forReturn = List<DocumentSnapshot>();

    ///povlacimo sve produkte iz baze
    QuerySnapshot queryProducts = await firestore
        .collection('products')
        .where('productFinished', isEqualTo: false)
        .getDocuments();
    List<DocumentSnapshot> prods = queryProducts.documents;

    ///sortiramo produkte prema nazivu kategorije
    prods.sort((a, b) => a['productCategory'].compareTo(b['productCategory']));

    ///izbacujemo duplikate iz liste produkata u odnosu na naziv kategorije
    int i = 0;
    while (i < prods.length - 1) {
      if (prods[i]['productCategory'] != prods[i + 1]['productCategory'])
        i++;
      else
        prods.removeAt(i + 1);
    }

    ///provjeravamo za svaku kategoriju da li postoji produkt sa tom kategorijom. U slucaju da postoji spremamo
    ///u listu kategorija koju cemo vratiti.
    for (final x in cats) {
      for (final y in prods) {
        if (x['categoryName'] == y['productCategory']) forReturn.add(x);
      }
    }

    return forReturn;
  }
}

class CityViewModel implements ReadCitiesInterface {
  @override

  ///jednostavan query pogresnog naziva za vracanje kategorija iz baze.
  Future getCitiesFromProducts() async {
    var firestore = Firestore.instance;
    QuerySnapshot queryCities =
        await firestore.collection('category').getDocuments();
    return queryCities;
  }
}
