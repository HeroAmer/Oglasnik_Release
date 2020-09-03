import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardContainer1.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatefulWidget {
  const ItemCardWidget({
    Key key,
    @required this.index,
    @required this.setStateParent,
    @required this.docs,
  }) : super(key: key);

  final index;
  //final dynamic widget;
  final Function setStateParent;
  final List<DocumentSnapshot> docs;

  @override
  _ItemCardWidgetState createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.of(context).push(
            FadeRoute(
              page: ProductDetails(
                productNameScreen: widget.docs[widget.index]['productName'],
                productIdScreen: widget.docs[widget.index]['productID'],
                setStateParent: widget.setStateParent,
              ),
            ),
          );
        },
        child: ItemCardContainer1(
          context: context,
          snapshot: widget.docs,
          index: widget.index,
          setStateParent: widget.setStateParent,
        ),
      ),
    );
  }
}
