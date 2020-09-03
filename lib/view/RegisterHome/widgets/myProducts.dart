import 'package:Oglasnik/view/RegisterHome/widgets/MyProductsWidgets/MyProductsWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List<DocumentSnapshot> myPosts = List<DocumentSnapshot>();
List myProducts = [];

class MyProducts extends StatefulWidget {
  @override
  _MyProductsState createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  bool showMessage = true;

  @override
  // ignore: override_on_non_overriding_member
  void justSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyProductsWidget(
          showMessage: showMessage,
          setStateParent: justSetState,
        ),
      ],
    );
  }
}
