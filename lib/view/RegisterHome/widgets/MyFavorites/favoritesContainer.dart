import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/MyFavorites/favItemRow.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/MyFavorites/favProductsRow.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:flutter/material.dart';

class FavContainer extends StatelessWidget {
  const FavContainer({
    Key key,
    this.index,
    this.snapshot,
  }) : super(key: key);
  final AsyncSnapshot snapshot;
  final int index;
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
          FavItemRow(
            snapshot: snapshot,
            index: index,
          ),
          Divider(
            thickness: SizeConfig.blockSizeVertical * 0.2,
          ),
          //extract
          email != null
              ? FavProductsRow(snapshot: snapshot, index: index)
              : itemCardTags(snapshot.data[index]),
        ],
      ),
    );
  }
}
