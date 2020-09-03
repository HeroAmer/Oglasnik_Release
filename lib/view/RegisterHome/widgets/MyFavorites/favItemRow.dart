import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardBodyDesc.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:flutter/material.dart';

class FavItemRow extends StatefulWidget {
  const FavItemRow({
    Key key,
    this.snapshot,
    this.index,
  }) : super(key: key);
  final AsyncSnapshot snapshot;
  final int index;

  @override
  _FavItemRowState createState() => _FavItemRowState();
}

class _FavItemRowState extends State<FavItemRow> {
  @override
  // ignore: override_on_non_overriding_member
  void justSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              itemCardProductName(
                  context, widget.snapshot.data[widget.index], justSetState),
              itemCardBodyDesc(widget.snapshot.data[widget.index]),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              itemCardImage(widget.snapshot.data[widget.index]),
              itemCardPrice(widget.snapshot.data[widget.index]),
            ],
          ),
        ),
      ],
    );
  }
}
