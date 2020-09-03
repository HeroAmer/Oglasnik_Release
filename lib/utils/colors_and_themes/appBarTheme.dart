import 'package:flutter/material.dart';

AppBarTheme buildAppBarTheme() {
  return AppBarTheme(
    color: Color.fromARGB(255, 226, 11, 48),
    elevation: 0.0,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'Roboto',
      ),
    ),
  );
}
