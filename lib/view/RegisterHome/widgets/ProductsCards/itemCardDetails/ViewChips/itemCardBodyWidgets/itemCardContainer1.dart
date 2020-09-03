import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardBodyDesc.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

class ItemCardContainer1 extends StatefulWidget {
  const ItemCardContainer1({
    Key key,
    this.context,
    this.snapshot,
    this.index,
    this.setStateParent,
  }) : super(key: key);
  final BuildContext context;
  final List<DocumentSnapshot> snapshot;
  final int index;
  final Function setStateParent;
  @override
  _ItemCardContainer1State createState() => _ItemCardContainer1State();
}

class _ItemCardContainer1State extends State<ItemCardContainer1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
      ),
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
                    itemCardProductName(context, widget.snapshot[widget.index],
                        widget.setStateParent),
                    itemCardBodyDesc(
                      widget.snapshot[widget.index],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    itemCardImage(widget.snapshot[widget.index]),
                    itemCardPrice(widget.snapshot[widget.index]),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: SizeConfig.blockSizeVertical * 0.2,
          ),
          email != null
              ? Row(
                  children: <Widget>[
                    itemCardTags(widget.snapshot[widget.index]), 
                    email != widget.snapshot[widget.index]['email']
                        ? Container(
                            child: IconButton(
                                color: Colors.white,
                                icon: favoritesList.contains(widget
                                        .snapshot[widget.index]['productID'])
                                    ? Icon(
                                        Icons.star,
                                        size: 30,
                                        color: mainAppColor,
                                      )
                                    : Icon(Icons.star_border,
                                        size: 30, color: starBorderColor),
                                onPressed: () async {
                                  FavoriteProduct().addOrRemoveFavorite(
                                      widget.index,
                                      widget.setStateParent,
                                      widget.snapshot);
                                }),
                          )
                        : Container(),
                  ],
                )
              : itemCardTags(widget.snapshot[widget.index]),
        ],
      ),
    );
  }
}
