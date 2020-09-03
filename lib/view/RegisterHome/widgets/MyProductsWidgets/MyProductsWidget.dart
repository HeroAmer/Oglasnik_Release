import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardWidget.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/myProducts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardBody.dart';

// ignore: must_be_immutable
class MyProductsWidget extends StatefulWidget {
  MyProductsWidget({
    Key key,
    @required this.showMessage,
    @required this.setStateParent,
  }) : super(key: key);

  bool showMessage;
  Function setStateParent;

  @override
  _MyProductsWidgetState createState() => _MyProductsWidgetState();
}

class _MyProductsWidgetState extends State<MyProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: Firestore.instance
            .collection('products')
            .where('email', isEqualTo: email)
            .where('productFinished', isEqualTo: false)
            .getDocuments(),
        builder: (BuildContext context, AsyncSnapshot snapshott) {
          if (snapshott.hasData) {
            myPosts.clear();
            myProducts.clear();
            myPosts = snapshott.data.documents;
            myPosts.forEach((element) {
              myProducts.add(element['productName']);
            });

            return myPosts == null || myPosts.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(TrazeniProizvod().nemaProizvoda),
                      )
                    ],
                  )
                : Container(
                    padding: EdgeInsets.only(bottom: 55),
                    child: ListView.builder(
                      itemCount: myPosts.length,
                      itemBuilder: (_, int index) {
                        if (index == myPosts.length - 1) {
                          if (locationIsSelected(
                              myPosts[index]['productLocation'],
                              selectedChips)) {
                            widget.showMessage = false;

                            return ItemCardWidget(
                              setStateParent: widget.setStateParent,
                              index: index,
                              docs: myPosts,
                            );
                          } else if (widget.showMessage == true) {
                            return Container(
                                margin: Margin().symmetric(30, 0),
                                child: Center(
                                    child: Text(EmptyProductList().emptyList)));
                          } else {
                            return Container();
                          }
                        } else {
                          if (locationIsSelected(
                              myPosts[index]['productLocation'],
                              selectedChips)) {
                            widget.showMessage = false;
                            return ItemCardWidget(
                              setStateParent: widget.setStateParent,
                              index: index,
                              docs: myPosts,
                            );
                          } else {
                            return Container();
                          }
                        }
                      },
                    ),
                  );
          } else {
            return CategoryLoading();
          }
        },
      ),
    );
  }
}
