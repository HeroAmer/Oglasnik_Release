import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

PageController pageController = PageController(initialPage: 0);
final db = Firestore.instance;

String userIDGlobal;

String productName,
    email,
    phoneNumber,
    productID,
    productCategory,
    productBrand,
    productLocation,
    productTag,
    productDesc,
    productImg1,
    productImg2,
    productImg3,
    productprice,
    productCijena;

GlobalKey<FormState> registerFormKey = new GlobalKey<FormState>();
GlobalKey<FormState> signInFormKey = new GlobalKey<FormState>();

GlobalKey<FormState> passwordChangeFormKey = new GlobalKey<FormState>();
GlobalKey<FormState> alertFormKey = new GlobalKey<FormState>();

GlobalKey<FormState> globalKeyPass() => passwordChangeFormKey;

String dropdownValueCategory = "Automobili";
String dropdownValueBrand = "Audi";
String updateDropdownValueCategory;
String updateDropdownValueBrand;
String updateProductName;
String updateProductPrice;
String updateProductTags;
String updateProductDescription;
String dropdownValueCity = 'Sarajevo';
String updateDropdownValueCity;

String newProductNameReturn,
    newProductTagsReturn,
    newProductDescriptionReturn,
    newProductPriceReturn;

String updateProductNameReturn,
    updateProductTagsReturn,
    updateProductDescriptionReturn,
    updateProductPriceReturn;

String updateProfileName,
    updateProfilePhoneNumber,
    updateProfileEmail,
    updateProfilePassword;

String forgetEmail;

String updateProfileNameReturn,
    updateProfilePhoneNumberReturn,
    updateProfileEmailReturn;

String passwordChangedToken, newPasswordChanged, confirmPasswordChanged;

String image1Name, image2Name, image3Name;
String registerFullName, registerEmail, registerPhoneNumber, registerPassword;
String signInEmail, signInPassword;

int buttonIdentifier;
bool buttonOne = false;
bool buttonTwo = false;
bool buttonThree = false;
bool allowAutoValidate = false;
bool registeredGlob = false;
bool createdGlob = false;
bool isLoading = false;
bool doesPop = true;
bool loadingGlob = false;

String slika1;

final GlobalKey<FormState> productNameFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productDescFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productTagFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productPriceFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> productCategoryDropDownKey = GlobalKey<FormState>();
final GlobalKey<FormState> productBrandFormKey = GlobalKey<FormState>();

final GlobalKey<FormState> updateproductNameFormKey = GlobalKey<FormState>();

List<String> categoryNames = List<String>();

bool hasInternetConnection = false;

///global variable that is true for 3 sec, when user wants to add more then 3 cities in filters
bool flushbarChecker = false;

var categoryBrands = Map();
List categoryBrand = [];
List numberofBrands = [];
var allBrands;
List<DocumentSnapshot> allProducts = List<DocumentSnapshot>();
List<String> favoritesList = List<String>();

List products = [];

String token, newPassword, confirmPassword, passwordConfirm;
bool doesMatch = false;

class Data {
  List imagesPass;
  Data({this.imagesPass});
}

bool createSwitcher = false;
bool azurload = false;
bool isDeleteShown1 = false;
bool isDeleteShown2 = false;
bool isDeleteShown3 = false;

String oldProductID;

List<String> myProductList = List<String>();
/*
String path1, path2, path3;
String fileName1, fileName2, fileName3;
FileType imageType = FileType.image;
List<String> allUsersList = List<String>();
*/
List<DocumentSnapshot> currentUser = List<DocumentSnapshot>();
List<String> current = List<String>();
