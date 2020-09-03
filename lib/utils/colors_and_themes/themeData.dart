import 'package:Oglasnik/utils/colors_and_themes/appBarTheme.dart';
import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color.fromARGB(255, 226, 11, 48),
    textSelectionHandleColor: Colors.grey[500].withOpacity(0.8),
    inputDecorationTheme: InputDecorationTheme(),
    buttonTheme: ButtonThemeData(
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Color.fromARGB(255, 226, 11, 48),
          style: BorderStyle.solid,
        ),
      ),
    ),
    appBarTheme: buildAppBarTheme(),
    textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(fontFamily: 'Roboto'),
        ),
  );
}
