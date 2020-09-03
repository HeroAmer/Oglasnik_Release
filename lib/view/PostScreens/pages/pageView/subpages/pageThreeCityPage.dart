import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/cityDropDown.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/tagsForm.dart';
import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  const CityPage({
    Key key,
    @required this.productSnapshot,
    @required this.editProduct,
  }) : super(key: key);

  final String editProduct;
  final Product productSnapshot;
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
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
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Column(
                children: <Widget>[
                  MainTitle(
                    editProduct: widget.editProduct,
                  ),
                  Container(margin: Margin().only(21, 0, 10, 10)),
                  CityDropDown(productSnapshot: widget.productSnapshot),
                  TagsForm(productSnapshot: widget.productSnapshot),
                  PageViewButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
