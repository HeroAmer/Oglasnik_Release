import 'package:Oglasnik/model/productCategory.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/Search/productSearchViewModel.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewCategory.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'CategoryCardContainer/categoryCardContainer.dart';

List categories = [];

class CategoryCard extends StatefulWidget {
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(children: <Widget>[
      ProductSearchDB(),
      Expanded(
        child: FutureBuilder(
            future: CategoryViewModel().getCategories(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                categories = snapshot.data
                    .map((doc) => ProductCategory.fromDocument(doc))
                    .toList();
                return CategoryCardContainer();
              } else {
                return Center(
                  child: CategoryLoading(),
                );
              }
            }),
      ),
    ]);
  }
}
