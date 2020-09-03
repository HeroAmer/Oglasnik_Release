import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/actionChips.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/dynamicChips.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardBodyContainer.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';

bool showMessage = true;

class ItemCardBody extends StatefulWidget {
  const ItemCardBody(
      {Key key,
      @required this.widget,
      @required this.categoryName,
      @required this.setStateParent})
      : super(key: key);

  final ItemCard widget;
  final String categoryName;
  final Function setStateParent;

  @override
  _ItemCardBodyState createState() => _ItemCardBodyState();
}

bool locationIsSelected(String location, List<String> selected) {
  if (selected.length == 0) return true;
  for (var i = 0; i < selected.length; i++) {
    if (location == selected[i]) return true;
  }
  return false;
}

class _ItemCardBodyState extends State<ItemCardBody> {
  refresh() {
    setState(() {});
  }

  //List<String> selectedChips = List<String>();

  ///Task rade: Faruk i Fahrudin
  ///
  ///Kreiranje filter chipova te ispisivanje gradova u njima
  ///
  ///Na pocetku ce biti dvije liste gradova cija cemo imena ispisivati u chipove (lista svih gradova - dynamicChips i
  ///lista odabranih - actionChips).
  ///Nakon sto sortiramo gradove abecedno, generisemo Widgete (Chip-ove) na osnovu stringova u listama. Prosljedjujemo
  ///tekst u sam Chip na osnovu liste i indexa. Stvari su analogne za dynamicChip-ove s tim da je razlika u tipovima
  ///chipova (Chip widget omogucava onDeleted property pa se automatski generise x button u samom chipu i on se koristi
  ///u actionChips, a ActionChips u dynamicChips (mozda smo malo neprecizno nazvali varijable, ali to nije toliko bitno))

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: Margin().only(2, 0, 0, 7),
            child: Text(
              'Filter',
              style: TextStyle(fontSize: 16.0),
            )),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ActionChipsWidget(refresh),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DynamicChipsWidget(refresh),
        ),
        Expanded(
            child: StreamBuilder(
                stream: Firestore.instance
                    .collection('products')
                    .where('productBrand',
                        isEqualTo: widget.widget.brandNameScreen)
                    .where('productCategory', isEqualTo: widget.categoryName)
                    .where('productFinished', isEqualTo: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      child: Center(
                        child: SpinnerCircular(),
                      ),
                    );
                  }
                  return ItemCardBodyContainer(
                    snapshot: snapshot,
                    context: context,
                    setStateParent: widget.setStateParent,
                  );
                })),
      ],
    );
  }
}
