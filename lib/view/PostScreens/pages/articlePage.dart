import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/backButtonsIphone/newbackButtonIphone.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/mainPageView.dart';

import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage(
      {Key key,
      @required this.editProduct,
      this.productSnapshot,
      this.productID})
      : super(key: key);
  final String editProduct;
  final Product productSnapshot;
  final String productID;
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  bool load = false;
  @override
  void initState() {
    dropDownInitialValueState();
    super.initState();
  }

  finishButtonPressed() {
    setState(() {
      load = true;
      doesPop = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    oldProductID = widget.productID;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: load
            ? Container(height: 0, width: 0)
            : newInputBackButtonIphone(context),
      ),
      body: WillPopScope(
        onWillPop: () async => Future.value(doesPop),
        child: PageViewPages(
          productSnapshot: widget.productSnapshot,
          editProduct: widget.editProduct,
          bottom: bottom,
          onFlatButtonPressed: finishButtonPressed,
        ),
      ),
    );
  }
}
