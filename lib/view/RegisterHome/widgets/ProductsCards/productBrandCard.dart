import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/searchPage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/ProductBrandContainer/productBrandContainer.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewBrand.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';

// ignore: must_be_immutable
class ProductBrandCard extends StatefulWidget {
  final String categoryName;
  ProductBrandCard({Key key, @required this.categoryName}) : super(key: key);
  @override
  _ProductBrandCardState createState() => _ProductBrandCardState();
}

class _ProductBrandCardState extends State<ProductBrandCard> {
  List<String> listaSlika = [];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(FadeRoute()),
        ),
        centerTitle: true,
        title: Text(widget.categoryName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      floatingActionButton:
          email != null ? MainFloatingButton() : homeFloatingAnimatedButton(),
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: bottomSheetColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
                future:
                    BrandViewModel().getBrandsByCategories(widget.categoryName),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    categoryBrand = snapshot.data;
                    return ProductBrandContainer(
                        categoryName: widget.categoryName);
                  } else {
                    return Center(
                      child: SpinnerCircular(),
                    );
                  }
                }),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 6,
          ),
        ],
      ),
    );
  }
}
