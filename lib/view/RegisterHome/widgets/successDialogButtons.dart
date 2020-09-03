import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/PostScreens/pages/articlePage.dart';
import 'package:flutter/material.dart';

class UreduButtonDialog extends StatelessWidget {
  const UreduButtonDialog({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
        color: Colors.white,
        child: Text(
          SuccessAlertDialog().uredu,
          style: TextStyle(
              color: Color.fromARGB(255, 226, 11, 48),
              fontFamily: 'Roboto',
              fontSize: 14),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }
}

class KreirajButtonDialog extends StatelessWidget {
  const KreirajButtonDialog({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      color: Colors.white,
      child: Text(
        SuccessAlertDialog().kreiraj,
        style: TextStyle(
            color: Color.fromARGB(255, 226, 11, 48),
            fontFamily: 'Roboto',
            fontSize: 14),
      ),
      onPressed: () {
        newProductNameReturn = null;
        newProductTagsReturn = null;
        newProductDescriptionReturn = null;
        newProductPriceReturn = null;
        image1Name = null;
        image2Name = null;
        image3Name = null;
        img1 = immutableImg1;
        img2 = immutableImg2;
        img3 = immutableImg3;
        createSwitcher = true;
        azurload = false;
        Navigator.of(context).pushReplacement(
          FadeRoute(
            page: ArticlePage(
              editProduct: UserProducts().newProduct,
              productSnapshot: null,
              productID: null,
            ),
          ),
        );
      },
    );
  }
}
