import 'package:Oglasnik/utils/colors_and_themes/themeData.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/getAllBrands.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewProductViewModel.dart';
import 'package:Oglasnik/viewModel/SignIn/signInViewModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart' as globals;

Future<void> splashScreenRouter() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  final id = prefs.getString('userID');
  globals.allBrands = await getAllBrands();
  globals.email = email;
  globals.userIDGlobal = id;
  globals.favoritesList.clear();
  FavoriteProduct().getAllFavoritesIDs().then((value) =>
      {for (final x in value) globals.favoritesList.add(x['productID'])});

  getMyProducts().then((value) =>
      {for (final x in value) globals.myProductList.add(x['productID'])});

  // globals.userIDGlobal = null;
  // getAllUsers().then((value) =>
  //     {for (final x in value) globals.allUsersList.add(x['userID'])});
  // print('lista user idijeva: ');
  // print(globals.allUsersList);

  print('Splash globalUserID:' + globals.userIDGlobal.toString());
  globals.registeredGlob = false;

  phoneNumberSetting(email);

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: email == null ? AnonymousHome() : RegisteredHome()));
}
