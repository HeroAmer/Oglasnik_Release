import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/addImageOneTextField.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

Container imageOneUploadButton(
    dynamic function, dynamic functionDelete, VoidCallback refresh) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: Margin().only(0, 0, 0, 5),
    child: Row(
      children: <Widget>[
        img1 != immutableImg1
            ? IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  functionDelete();
                  refresh();
                },
              )
            : image1Name == null
                ? IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.transparent,
                    ),
                    onPressed: null)
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                    ),
                    onPressed: () {
                      functionDelete();
                      refresh();
                    },
                  ),
        FlatButton.icon(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
            ),
          ),
          icon: Icon(
            Icons.add_circle,
            color: Colors.black,
            size: 25,
          ),
          label: AddImageOne(),
          onPressed: function,
        ),
      ],
    ),
  );
}
