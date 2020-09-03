import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/imagePageWidget.dart';
import 'package:flutter/material.dart';

class PageFive extends StatefulWidget {
  const PageFive({
    Key key,
    @required this.bottom,
    @required this.onFlatButtonPressed,
    @required this.editProduct,
    @required this.productSnapshot,
  }) : super(key: key);

  final double bottom;
  final VoidCallback onFlatButtonPressed;
  final String editProduct;
  final Product productSnapshot;
  @override
  _PageFiveState createState() => _PageFiveState();
}

class _PageFiveState extends State<PageFive> {
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
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            reverse: true,
            child: ImagePageWidget(
              bottom: widget.bottom,
              editProduct: widget.editProduct,
              productSnapshot: widget.productSnapshot,
              onFlatButtonPressed: widget.onFlatButtonPressed,
            ),
          ),
        ),
      ),
    );
  }
}
