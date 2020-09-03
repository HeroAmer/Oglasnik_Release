import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/articlePageWidget.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({
    Key key,
    @required this.bottom,
    @required this.editProduct,
    @required this.productSnapshot,
  }) : super(key: key);

  final double bottom;
  final Product productSnapshot;
  final String editProduct;
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
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
        // ignore: missing_return
        onWillPop: () {
          Navigator.of(context).pushAndRemoveUntil(
              FadeRoute(page: RegisteredHome()),
              (Route<dynamic> route) => false);
          registeredGlob = false;
        },
        child: Scaffold(
          body: SingleChildScrollView(
            reverse: true,
            child: ArticlePageWidget(
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
