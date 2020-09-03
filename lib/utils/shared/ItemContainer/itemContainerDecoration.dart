import 'package:flutter/material.dart';

BoxDecoration itemContainerDecoration() {
  return BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 7,
        offset: Offset(0, 3),
      ),
    ],
    border: Border.all(
      color: Colors.black26,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(4),
    ),
  );
}
