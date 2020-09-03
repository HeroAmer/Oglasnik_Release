import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/opisTextField.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';

class DescriptionPageWidget extends StatefulWidget {
  const DescriptionPageWidget({
    Key key,
    @required this.bottom,
    @required this.productSnapshot,
    @required this.editProduct,
  }) : super(key: key);
  final String editProduct;
  final Product productSnapshot;
  final double bottom;

  @override
  _DescriptionPageWidgetState createState() => _DescriptionPageWidgetState();
}

class _DescriptionPageWidgetState extends State<DescriptionPageWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Container(
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
              child: OpisTextField(
                productSnapshot: widget.productSnapshot,
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 28,
            ),
            PageViewButton(),
          ],
        ),
      ),
    );
  }
}
