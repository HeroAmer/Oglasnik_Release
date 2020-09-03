import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/ItemContainer/itemContainerDecoration.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductWidgets/itemCardDesc.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:flutter/material.dart';

Container itemContainer(
    BuildContext context, int index, Function setStateParent) {
  return Container(
    decoration: itemContainerDecoration(),
    margin: Margin().only(4, 2, 5, 5),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  itemCardProductName(
                      context, selectedProductsGlobal[index], setStateParent),
                  itemCardDesc(index),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  itemCardImage(selectedProductsGlobal[index]),
                  itemCardPrice(selectedProductsGlobal[index]),
                ],
              ),
            ),
          ],
        ),
        Divider(
          thickness: SizeConfig.blockSizeVertical * 0.2,
        ),
        //itemCardTags(selectedProducts[index]),
        email != null
            ? Row(
                children: <Widget>[
                  itemCardTags(selectedProductsGlobal[index]),
                  email != selectedProductsGlobal[index]['email']
                      ? Container(
                          child: IconButton(
                              color: Colors.white,
                              icon: favoritesList.contains(
                                      selectedProductsGlobal[index]
                                          ['productID'])
                                  ? Icon(
                                      Icons.star,
                                      size: 30,
                                      color: mainAppColor,
                                    )
                                  : Icon(Icons.star_border,
                                      size: 30, color: starBorderColor),
                              //extract Fahrudin
                              onPressed: () async {
                                FavoriteProduct().addOrRemoveFavorite(index,
                                    setStateParent, selectedProductsGlobal);
                              }),
                        )
                      : Container(),
                ],
              )
            : itemCardTags(selectedProductsGlobal[index]),
      ],
    ),
  );
}
