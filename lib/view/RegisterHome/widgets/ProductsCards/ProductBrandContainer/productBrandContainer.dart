import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/ProductBrandContainer/getBrandData.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/categoryBrands.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/ProductBrandContainer/productBrandTitle.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/ProductBrandContainer/productBrandNumberItems.dart';

class ProductBrandContainer extends StatelessWidget {
  final String categoryName;

  const ProductBrandContainer({Key key, @required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryBrand.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              citysuggestions.addAll(selectedChips);
              selectedChips.clear();
              Navigator.of(context).push(
                FadeRoute(
                  page: ItemCard(
                    brandNameScreen: categoryBrand[index],
                    categoryName: categoryName,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(5, 5), // changes position of shadow
                  ),
                ],
                border: Border.all(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: Margin().only(2, 3, 5, 5),
              child: Container(
                height: SizeConfig.blockSizeVertical * 25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder(
                        future: numberOfProductsPerBrandTest(
                            categoryBrand[index], categoryName),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshott) {
                          if (!snapshott.hasData)
                            return Expanded(
                              child: Center(
                                child: SpinnerCircular(),
                              ),
                            );
                          else {
                            return Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  productBrandTitle(context, index),
                                  productBrandNumberItems(snapshott, index),
                                ],
                              ),
                            );
                          }
                        }),
                    Container(
                      child: Expanded(
                        child: Container(
                          margin: Margin().only(2, 2, 3, 0),
                          child: getBrandDataFutureBuilder(categoryName, index),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
