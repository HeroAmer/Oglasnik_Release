import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsTags.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsTagsAndStar extends StatefulWidget {
  final index;
  final List<DocumentSnapshot> docs;
  const ProductDetailsTagsAndStar({
    Key key,
    @required this.index,
    @required this.docs,
  }) : super(key: key);

  @override
  _ProductDetailsTagsAndStarState createState() =>
      _ProductDetailsTagsAndStarState();
}

class _ProductDetailsTagsAndStarState extends State<ProductDetailsTagsAndStar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        productDetailsTagsWidget(widget.index), 
        email != widget.docs[widget.index]['email']
            ? Container(
                child: IconButton(
                    color: Colors.white,
                    icon: favoritesList
                            .contains(widget.docs[widget.index]['productID'])
                        ? Icon(
                            Icons.star,
                            size: 30,
                            color: mainAppColor,
                          )
                        : Icon(Icons.star_border,
                            size: 30, color: starBorderColor),

                    //extract
                    onPressed: () async {
                      FavoriteProduct()
                          .addOrRemoveFavorite(widget.index, null, widget.docs);

                      setState(() {});
                    }),
              )
            : Container(),
      ],
    );
  }
}
