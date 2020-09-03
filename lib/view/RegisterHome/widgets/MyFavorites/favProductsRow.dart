import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:flutter/material.dart';

class FavProductsRow extends StatefulWidget {
  const FavProductsRow({
    Key key,
    this.snapshot,
    this.index,
  }) : super(key: key);

  final AsyncSnapshot snapshot;
  final int index;

  @override
  _FavProductsRowState createState() => _FavProductsRowState();
}

class _FavProductsRowState extends State<FavProductsRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        itemCardTags(widget.snapshot.data[widget.index]),
        email != widget.snapshot.data[widget.index]['email']
            ? Container(
                child: IconButton(
                  color: Colors.white,
                  icon: favoritesList.contains(
                          widget.snapshot.data[widget.index]['productID'])
                      ? Icon(
                          Icons.star,
                          size: 30,
                          color: mainAppColor,
                        )
                      : Icon(Icons.star_border,
                          size: 30, color: starBorderColor),
                  //extract
                  onPressed: () async {
                    final result = favoritesList.contains(
                        widget.snapshot.data[widget.index]['productID']);
                    if (result) {
                      favoritesList.remove(
                          widget.snapshot.data[widget.index]['productID']);
                      await FavoriteProduct().removeFavorite(email,
                          widget.snapshot.data[widget.index], userIDGlobal);
                      setState(() {});
                    } else {
                      favoritesList
                          .add(widget.snapshot.data[widget.index]['productID']);
                      await FavoriteProduct().addFavorite(email,
                          widget.snapshot.data[widget.index], userIDGlobal);
                      setState(() {});
                    }
                  },
                ),
              )
            : Container(),
      ],
    );
  }
}
