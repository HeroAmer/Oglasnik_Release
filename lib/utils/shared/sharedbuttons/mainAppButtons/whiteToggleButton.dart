import 'dart:ui';

import 'package:flutter/material.dart';

//all white button, used as toggle between signin and register pages
SizedBox buttons(String text, dynamic function) {
  return SizedBox(
    height: 50,
    width: 250,
    child: RaisedButton(
      elevation: 0,
      onPressed: function,
      color: Color.fromARGB(255, 225, 255, 255),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto', //#TODO  postaviti ROBOTO medium
          fontSize: 14,
        ),
      ),
    ),
  );
}
