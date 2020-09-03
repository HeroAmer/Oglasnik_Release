import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/nazivTextField.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:Oglasnik/viewModel/ImageUpload/initUpdateValues.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

class ArticlePageWidget extends StatefulWidget {
  const ArticlePageWidget({
    Key key,
    @required this.bottom,
    @required this.editProduct,
    @required this.productSnapshot,
  }) : super(key: key);

  final double bottom;
  final Product productSnapshot;
  final String editProduct;
  @override
  _ArticlePageWidgetState createState() => _ArticlePageWidgetState();
}

class _ArticlePageWidgetState extends State<ArticlePageWidget> {
  @override
  Widget build(BuildContext context) {
    //extract
    if (!createSwitcher) {
      initUpdatedValues(widget.productSnapshot);
    }

    SizeConfig().init(context);
    return Container(
      child: Column(
        children: <Widget>[
          MainTitle(
            editProduct: widget.editProduct,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 20,
          ),
          Container(
            margin: Margin().only(0, 0, 10, 10),
            child: NazivTextField(
              productSnapshot: widget.productSnapshot,
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 25,
          ),
          PageViewButton(),
        ],
      ),
    );
  }
}
