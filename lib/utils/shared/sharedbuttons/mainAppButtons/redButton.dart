import 'dart:ui';

import 'package:flutter/material.dart';

SizedBox button(dynamic nameFunction, dynamic function) {
  return SizedBox(
    height: 50,
    width: 250,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      onPressed: function,
      color: Color.fromARGB(255, 226, 11, 48),
      child: Text(
        nameFunction,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto', //#TODO  postaviti ROBOTO medium
          fontSize: 14,
        ),
      ),
    ),
  );
}
