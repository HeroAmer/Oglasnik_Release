//klase poredane po folderima iz view-a

class NewPostScreen {
  String unosNaslov = "Novi unos";
}

class MoneyText {
  String kmText = "KM";
}

class FilterFlush {
  String naslov = "Pogreška!";
}

class FilterTitle {
  String filterNaslov = 'Filter';
}

class TrazeniProizvod {
  String trazeniProizvod = 'U bazi trenutno nemamo traženi proizvod';
  String nemaProizvoda = 'Lista vaših proizvoda je prazna';
}

class Welcome {
  String dobrodosli = 'Dobrodošli u Oglasnik';
}

class AppLabelsAuth {
  String signInButton = 'testing';
  String registracija = 'Registruj se';
}

//..view//AnonymusHome
class AnonymusHomePages {
  String appBarAnon = "Oglasnik";
}

class AnonymusHomeWidgets {
  String podDugmePrijava = "Prijava";
  String podDugmeRegistracija = "Registracija";
}

//..view//PasswordChange
class PasswordChangePage {
  String columnFirstChild = "Promijeni šifru";
  String firstChildFontFamily = "Roboto";
  String textFieldHint = "Unesi kod";
  String secondTextFieldHint = "email";
  String thirdTextFieldHint = "Potvrdi šifru";
  String buttonString = "Sačuvaj";
  String collectionName = "firestoreUsers";
  String updatedDataString = "password";
}

//..view/RegisterHome
class RegistereHomePages {
  String naslov = "Oglasnik";
}

class RegisterHomeWidgets {
  String dodavanjeOglasa = "Novi oglas";
}

//..view/RegistrationPageAuth
class RegistrationPageAuthPages {
  String prijava = "Prijavi se";
  String prviHint = "Ime i prezime";
  String drugiHint = "Email";
  String treciHint = "Lozinka";
  String cetvrtiHint = "Broj telefona";
  String registrovanje = "Registracija";
}

class RegistrationPageAuthFirstWidget {
  String databaseCollection = "firestoreUsers";
  // print statements and keys arent refactored
}

class RegistrationPageAuthSecondWidget {
  String firstHint = "Ime i prezime";
  String secondHint = "Email";
  String thirdHint = "Lozinka";
  String fourthHint = "Broj telefona";
  String buttonText = "Registruj se";
  String nameOfFormText = "Registracija";
}

class RegistrationPageAuthThirdWidget {
  String dobrodoslica = "Dobrodošli u Oglasnik";
}

//..view/SignInPage
class SignInPagePages {
  //print statementi nisu refaktorisani
  String registracijaField = "Registruj se";
}

class SignInPageWidgetOne {
  String emailHint = "Email";
  String odustaniDugme = "ODUSTANI";
  String fontFamilyDugmadi = "Roboto";
  String dugmeZaSlanje = "POŠALJI KOD";
}

class SignInPageWidgetTwo {
  String emailHint = "Email";
  String passHint = "Lozinka";
  String dugmePrijave = "Prijavi se";
  String forgottenPass = "Zaboravili ste lozinku?";
  String fontZaText = "Roboto";
}

class SignInPageWidgetThree {
  //nema stringova za sada
}

class SignInPageWidgetFout {
  String prijavaTekst = "Prijava";
}

class EmptyProductList {
  String emptyList = "U bazi trenutno nema traženog proizvoda";
}

class SuccessAlertDialog {
  String odlicno = "Odlično!";
  String cestitamo = "Čestitamo!";
  String azuriranje = "Uspješno!";
  String azuriranjeopis = "Artikal je ažuriran!";
  String opis1 =
      "Uspješno ste se registrovali na našu platformu Oglasnik.Sada možete napraviti svoj prvi artikal i ponuditi ga našim korisnicima.";
  String opis2 = "Želimo Vam uspješno trgovanje.";
  String opis3 =
      "Uspješno ste kreirali novi artikal na našoj platformi Oglasnik.";

  String uredu = "UREDU";
  String kreiraj = "KREIRAJ";
  String napusti = "NAPUSTI";
  String empty = "";
  String obrisinaslov = "Završi artikal?";
  String obrisitext = "Da li ste sigurni da želite završiti artikal?";
  String delete = "ZAVRŠI";
  String odustani = "ODUSTANI";
  String leave = "Napusti unos?";
  String leaveopis = "Da li ste sigurni da želite napustiti novi unos?";
  String leaveopis2 = "Ovaj artikal neće biti spašen!";
}

//..view/SplashScreen
class SplashScreen {
  String splashText = "OGLASNIK";
  String fontFamily = "Roboto";
  String animationText = "Pronađi nešto za sebe";
}

class ProductDetailsStrings {
  String callText = 'NAZOVI';
  String callInfoText = 'Kontakt telefon';
  /*String cityLocation = 'Sarajevo';
  String productPriceText = '72.000 KM';
  String categoryName = 'Automobili';
  String productName = 'Audi A6';
  String productTestDesc =
      'Prodajem Audi A6 2012 godište, u izvrsnom stanju sa ljetnim gumama. Registrovan do maja 2020. Sve informacije na broj 061367223. Moguca je zamjena za ovaj artikal.';
  
  
  String callNumberText = '060 335 221 3';*/
}

class UserProducts {
  String editProfile = 'UREDI';
  String editProduct = 'Uredi unos';
  String newProduct = 'Novi unos';
  String finishProduct = 'ZAVRŠI';
}

class Titles {
  String myPosts = 'Moji oglasi';
  String myFavorites = 'Sačuvani oglasi';
  String updateProfile = "Profil";
}

class ImageOneUpload {}

class ImageTwoUpload {}

class ImageThreeUpload {}

String next = 'Dalje';
String lastPage = 'Završi';
bool alertstatus = false;
bool status = false;
bool tokenstatus = false;
var nepoklapanje = false;
bool allowUserToChangePassword = false;
bool allowUserToRegister = true;
bool allowUsertoUpdateEmail = false;
bool currentEmail = false;

class FlushBarText {
  String message = "Nije moguće odabrati više od 3 grada.";
}

class InternetConnectionMessage {
  String errorHead = "Provjerite internet konekciju \n";
  String errorBody =
      'Željena opcija nije dostupna, jer veza sa internet provajderom ne postoji';
  String buttonOK = 'Pokušajte ponovo';
}

class SearchPageText {
  String hintText = "Pretraga";
}

class LoadingText {
  String kreiranjeText = " Kreiranje artikla...";
  String updateText = "Ažuriranje artikla...";
}

//#TODO create file named "globalVariables" and there store global Variables such as GlobalKey etc
String img1 = "Dodaj sliku 1";
String img2 = "Dodaj sliku 2";
String img3 = "Dodaj sliku 3";
String pathGlobal1, pathGlobal2, pathGlobal3;
String productImg1Update, productImg2Update, productImg3Update;

final String immutableImg1 = "Dodaj sliku 1";
final String immutableImg2 = "Dodaj sliku 2";
final String immutableImg3 = "Dodaj sliku 3";

bool favorite = true;
final String noPhoto = "assets/images/nophoto.jpg";
//final String noPhotoNetwork =
//    "https://firebasestorage.googleapis.com/v0/b/oglasnik-d920b.appspot.com/o/images%2Fnophoto.jpg?alt=media&token=cd241b95-8a79-4f1b-a4e0-4f4a77c255a8";
final String noPhotoNetwork =
    "https://firebasestorage.googleapis.com/v0/b/oglasnik-d920b.appspot.com/o/nophoto.jpg?alt=media&token=5d32f73b-c9cc-40e2-96eb-c5bc1b5004b7";
List<String> productsForSearch = List<String>();
List<String> productsAndBrandList = List<String>();
List<String> suggestionsList;
final List<String> cityDropdownItems = <String>[
  'Apatin',
  'Aranđelovac',
  'Bačka Palanka',
  'Bačka Topola',
  'Banja Luka',
  'Bečej',
  'Belgrade',
  'Bihać',
  'Bijeljina',
  'Bjelovar',
  'Bor',
  'Bosanska Krupa',
  'Brčko',
  'Bugojno',
  'Cazin',
  'Čačak',
  'Čakovec',
  'Ćuprija',
  'Doboj',
  'Dubrovnik',
  'Goražde',
  'Gornji Milanovac',
  'Gračanica',
  'Gradačac',
  'Inđija',
  'Jagodina',
  'Karlovac',
  'Kikinda',
  'Knjazevac',
  'Konjic',
  'Koprivnica',
  'Kragujevac',
  'Kraljevo',
  'Kruševac',
  'Lazarevac',
  'Leskovac',
  'Mostar',
  'Negotin',
  'Niš',
  'Nova Pazova',
  'Novi Pazar',
  'Novi Sad',
  'Obrenovac',
  'Osijek',
  'Pančevo',
  'Pirot',
  'Požarevac',
  'Požega',
  'Prijedor',
  'Prokuplje',
  'Pula',
  'Rijeka',
  'Ruma',
  'Samobor',
  'Sarajevo',
  'Senta',
  'Sesvete',
  'Sisak',
  'Slavonski Brod',
  'Smederevo',
  'Smederevska Palanka',
  'Solin',
  'Sombor',
  'Split',
  'Sremčica',
  'Sremska Mitrovica',
  'Stara Pazova',
  'Subotica',
  'Šabac',
  'Šibenik',
  'Travnik',
  'Trebinje',
  'Trstenik',
  'Tuzla',
  'Užice',
  'Valjevo',
  'Varaždin',
  'Velika Gorica',
  'Velika Kladuša',
  'Vinkovci',
  'Virovitica',
  'Visoko',
  'Vranje',
  'Vrbas',
  'Vršac',
  'Vukovar',
  'Zadar',
  'Zagreb',
  'Zagreb - Centar',
  'Zagreb- Stenjevec',
  'Zaječar',
  'Zaprešić',
  'Zemun',
  'Zenica',
  'Zrenjanin',
];
