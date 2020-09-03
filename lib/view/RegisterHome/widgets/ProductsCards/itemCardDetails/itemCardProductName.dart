import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemName.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

InkWell itemCardProductName(
    BuildContext context, DocumentSnapshot snapshott, Function setStateParent) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        FadeRoute(
          page: ProductDetails(
            productNameScreen: snapshott['productName'],
            productIdScreen: snapshott['productID'],
            setStateParent: setStateParent,
          ),
        ),
      );
    },
    child: ItemName(
      name: snapshott['productName'],
    ),
  );
}
