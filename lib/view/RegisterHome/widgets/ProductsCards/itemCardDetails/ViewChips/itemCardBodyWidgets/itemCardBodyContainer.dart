import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardWidget.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardBody.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

class ItemCardBodyContainer extends StatefulWidget {
  const ItemCardBodyContainer({
    Key key,
    @required this.snapshot,
    @required this.context,
    @required this.setStateParent,
  }) : super(key: key);

  final AsyncSnapshot snapshot;
  final BuildContext context;
  final Function setStateParent;

  @override
  _ItemCardBodyContainerState createState() => _ItemCardBodyContainerState();
}

class _ItemCardBodyContainerState extends State<ItemCardBodyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 75),
      child: ListView.builder(
        itemCount: widget.snapshot.data.documents.length,
        itemBuilder: (_, int index) {
          if (index == widget.snapshot.data.documents.length - 1) {
            if (locationIsSelected(
                widget.snapshot.data.documents[index]['productLocation'],
                selectedChips)) {
              showMessage = false;
              return ItemCardWidget(
                setStateParent: widget.setStateParent,
                index: index,
                docs: widget.snapshot.data.documents,
              );
            } else if (showMessage == true) {
              return Container(
                  height: SizeConfig.blockSizeVertical * 60,
                  child: Center(child: Text(EmptyProductList().emptyList)));
            } else {
              return Container();
            }
          } else {
            if (locationIsSelected(
                widget.snapshot.data.documents[index]['productLocation'],
                selectedChips)) {
              showMessage = false;

              return ItemCardWidget(
                setStateParent: widget.setStateParent,
                index: index,
                docs: widget.snapshot.data.documents,
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
