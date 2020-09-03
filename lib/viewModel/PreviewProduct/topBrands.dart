import 'package:Oglasnik/viewModel/PreviewProduct/categoryBrands.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Iz ove funkcije je nastala funkcija top3BrandsPerCategoryV2 koja se koristi u projektu i ova se funkcija nigdje ne koristi,
/// ali je ostavljena u slucaju promjene zahtjeva klijenta u smislu dizajna. Razlika izmedju ove funkcije i gore navedene
/// je u tome sto ce ova vratiti u svakom slucaju 3 branda iako ce mozda biti neki od njih sa 0 produkata u bazi.
/// Ostatak tijela funkcije je podudaran sa top3BrandsPerCategoryV2 koja je dole opisana.
/*
top3BrandsPerCategory(String categoryName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('productCategory', isEqualTo: categoryName)
      .getDocuments();

  final List<DocumentSnapshot> documents = productsQuery.documents;
  final List<String> stringsForReturn = List<String>();
  for (final x in documents) {
    stringsForReturn.add(x["productBrand"]);
  }

  final top3 = <String, dynamic>{};

  for (final item in stringsForReturn) {
    var numb = await numberOfProductsPerBrandTest(item);
    top3[item] = numb;
  }

  stringsForReturn.sort((a, b) => top3[b].compareTo(top3[a]));

  int i = 0;
  while (i < stringsForReturn.length - 1) {
    if (stringsForReturn[i] != stringsForReturn[i + 1])
      i++;
    else
      stringsForReturn.removeAt(i + 1);
  }

  if (stringsForReturn.length < 3) {
    final QuerySnapshot productBrands = await Firestore.instance
        .collection('categoryBrand')
        .where('categoryName', isEqualTo: categoryName)
        .getDocuments();
    final List<DocumentSnapshot> catBrandDoc = productBrands.documents;

    for (final x in catBrandDoc[0]["brands"]) {
      var numX = await numberOfProductsPerBrandTest(x);
      if (numX == 0) stringsForReturn.add(x);
      if (stringsForReturn.length >= 3) break;
    }
  }

  final mapForReturn = <String, dynamic>{};
  for (final x in stringsForReturn) {
    var numX = await numberOfProductsPerBrandTest(x);
    mapForReturn[x] = numX;
    if (mapForReturn.length == 3) break;
  }

  //return stringsForReturn.sublist(0, 3);

  return mapForReturn;
}
*/
/// Ova funkcija ce sluziti prilikom ispisa 3 branda sa najvise produkata u category karticama na home page-u. Na pocetku
/// povlacimo sve proizvode iz baze iz odredjene kategorije i smjestamo ih u lokalnu listu. U odvojen string potom
/// smjestamo nazive brandova tih produkata te u mapu tipa <String, dynamic> smjestamo uredjene parove key - value gdje
/// ce key biti naziv branda, a value koliko se puta ponavlja taj brand u bazi (pomocu posebno napisane funkcije).
/// Ta mapa nam je potrebna kako bismo mogli sortirati nazive brandova posto ne mozemo unutar sort funkcije koristiti nikakve
/// asinhrone funkcije (jer sort radi sinhrono). Nakon sto je lista stringova sortirana, izbacujemo iz nje sve duplikate
/// (u sustini pravimo set od liste dokumenata prema nazivu branda). Kada smo dobili te stringove, napravimo novu
/// mapu u kojoj cemo imati upravo te stringove i broj njihovih ponavljanja i nju cemo vratiti iz funkcije. Kada dostignemo
/// duzinu 3, prekidamo petlju jer je potrebno vratiti najvise 3 brand-a. Vracamo ovu mapu na ovaj nacin posto je potrebno
/// u category karticama ispisati i naziv brand-a i broj produkata tog tipa u bazi.
top3BrandsPerCategoryV2(String categoryName) async {
  ///povlacenje produkata sa trazenom kategorijom iz baze
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('productCategory', isEqualTo: categoryName)
      .where('productFinished', isEqualTo: false)
      .getDocuments();

  final List<DocumentSnapshot> documents = productsQuery.documents;

  ///smjestanje naziva brand-ova u posebnu listu
  final List<String> stringsForReturn = List<String>();
  for (final x in documents) {
    stringsForReturn.add(x["productBrand"]);
  }

  final top3 = <String, dynamic>{};

  ///pravljenje mape tipa key: naziv branda, value: broj ponavljanja u bazi koja ce nam pomoci prilikom sortiranja
  for (final item in stringsForReturn) {
    var numb = await numberOfProductsPerBrandTest(item, categoryName);
    top3[item] = numb;
  }

  stringsForReturn.sort((a, b) => top3[b].compareTo(top3[a]));

  ///izbacivanje svih duplikata iz liste stringova (naziva brand-ova)
  int i = 0;
  while (i < stringsForReturn.length - 1) {
    if (stringsForReturn[i] != stringsForReturn[i + 1])
      i++;
    else
      stringsForReturn.removeAt(i + 1);
  }

  ///formiramo mapu koju cemo vratiti iz funkcije na osnovu gore napravljene liste brandova
  final mapForReturn = <String, dynamic>{};
  for (final x in stringsForReturn) {
    var numX = await numberOfProductsPerBrandTest(x, categoryName);
    mapForReturn[x] = numX;
    if (mapForReturn.length == 3) break;
  }

  //return stringsForReturn.sublist(0, 3);

  return mapForReturn;
}
