import 'dart:ui';

import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:flutter/material.dart';

SizedBox lightbutton(dynamic nameFunction, dynamic function) {
  return SizedBox(
    height: 36,
    width: 124,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      onPressed: function,
      color: backgroundActionChip,
      child: Text(
        nameFunction,
        style: TextStyle(
          color: textActionChip,
          fontFamily: 'Roboto',
          fontSize: 14,
        ),
      ),
    ),
  );
}
