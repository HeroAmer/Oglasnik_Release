import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/descriptionPageWidget.dart';
import 'package:flutter/material.dart';

class PageFour extends StatefulWidget {
  const PageFour({
    Key key,
    @required this.bottom,
    @required this.productSnapshot,
    @required this.editProduct,
  }) : super(key: key);

  final double bottom;
  final String editProduct;
  final Product productSnapshot;
  @override
  _PageFourState createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: WillPopScope(
        onWillPop: () => Future.sync(onWillPop),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
            reverse: true,
            child: DescriptionPageWidget(
              bottom: widget.bottom,
              editProduct: widget.editProduct,
              productSnapshot: widget.productSnapshot,
            ),
          ),
        ),
      ),
    );
  }
}
