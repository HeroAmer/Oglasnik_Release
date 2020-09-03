import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/topBrands.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/CategoryCardContainer/categoryNameRow.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/CategoryCardContainer/threeCategoriesWidget.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/CategoryCardContainer/oneCategoryWidget.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/CategoryCardContainer/twoCategoriesWidget.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

class CategoryCardContainer extends StatefulWidget {
  const CategoryCardContainer({
    Key key,
  }) : super(key: key);

  @override
  _CategoryCardContainerState createState() => _CategoryCardContainerState();
}

class _CategoryCardContainerState extends State<CategoryCardContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 55),
      child: ListView.builder(
          cacheExtent: 10000.0,
          itemCount: categories.length,
          shrinkWrap: false,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: Margin().only(3, 2, 5, 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: categoryNameRow(context, index),
                  ), 
                  Divider(
                    thickness: SizeConfig.blockSizeVertical * 0.2,
                  ),
                  FutureBuilder(
                      future: top3BrandsPerCategoryV2(
                          categories[index].categoryName),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<String> names = snapshot.data.keys.toList();
                          List<dynamic> counts = snapshot.data.values.toList();
                          return names.length == 3 
                              ? threeCategoriesWidget(index, names, counts,
                                  categories[index].categoryName)
                              : names.length == 2
                                  ? twoCategoriesWidget(index, names, counts,
                                      categories[index].categoryName)
                                  : names.length == 1
                                      ? oneCategoryWidget(index, names, counts,
                                          categories[index].categoryName)
                                      : Container(
                                          width: 0,
                                          height: 0,
                                        );
                        } else {
                          return Center(
                            child: SpinnerCircular(),
                          );
                        }
                      }),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
