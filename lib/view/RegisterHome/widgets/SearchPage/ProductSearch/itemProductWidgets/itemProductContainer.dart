import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardBody.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductWidgets/itemContainer.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductName.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<DocumentSnapshot> selectedProductsGlobal = List<DocumentSnapshot>();

class ItemProductContainer extends StatelessWidget {
  const ItemProductContainer({
    Key key,
    //@required this.selectedProducts,
    @required this.showMessage,
    @required this.setStateParent,
    @required this.additionals,
  }) : super(key: key);

  //final List<DocumentSnapshot> selectedProducts;
  final bool showMessage;
  final Function setStateParent;
  final List<DocumentSnapshot> additionals;

  @override
  Widget build(BuildContext context) {
    selectedProductsGlobal.addAll(additionals);
    bool showMessage = true;
    return Container(
      padding: EdgeInsets.only(bottom: 55),
      child: ListView.builder(
        itemCount: selectedProductsGlobal.length,
        itemBuilder: (_, int index) {
          print(selectedProductsGlobal.length);
          if (index == selectedProductsGlobal.length - 1) {
            if (locationIsSelected(
                selectedProductsGlobal[index]['productLocation'],
                selectedChips)) {
              showMessage = false;

              return Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    itemProductName(context, index, setStateParent);
                  },
                  child: itemContainer(context, index, setStateParent),
                ),
              );
            } else if (showMessage == true) {
              return Container(
                  margin: Margin().symmetric(30, 0),
                  child: Center(child: Text(EmptyProductList().emptyList)));
            } else {
              return Container();
            }
          } else {
            if (locationIsSelected(
                selectedProductsGlobal[index]['productLocation'],
                selectedChips)) {
              showMessage = false;

              return Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    itemProductName(context, index, setStateParent);
                  },
                  child: itemContainer(context, index, setStateParent),
                ),
              );
            } else {
              return Container();
            }
          }
        },
      ),
    );
  }
}
