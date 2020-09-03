import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/categoryDropButton.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:Oglasnik/viewModel/CreateProduct/productCategoryViewModel.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/custom_dropdown.dart'
    as custom;

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    Key key,
    @required this.productSnapshot,
    @required this.editProduct,
  }) : super(key: key);

  final String editProduct;
  final Product productSnapshot;
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
                  Container(margin: Margin().only(22, 0, 10, 10)),
                  
                  Container(
                    margin: Margin().symmetric(0, 9),
                    child: Card(
                        elevation: 16,
                        child: Container(
                            margin: Margin().only(0, 0, 2, 5),
                            child: Center(
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: custom.DropdownButton<String>(
                                      selectedItemBuilder:
                                          (BuildContext context) {
                                        return categoryNames
                                            .map<Widget>((String item) {
                                          return Text(item);
                                        }).toList();
                                      },
                                      value: createSwitcher
                                          ? dropdownValueCategory
                                          : updateDropdownValueCategory,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.229,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      isExpanded: true,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 4,
                                        height: 1.5,
                                      ),
                                      underline: Container(),
                                      onChanged: (String productCategoryList) =>
                                          setState(
                                        () => categoryListValue(
                                            productCategoryList),
                                      ),
                                      items: categoryNames
                                          .map<custom.DropdownMenuItem<String>>(
                                              (String value) {
                                        return custom.DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ))))),
                  ),
                
                CategoryDropButton(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 11.7,
                  ),
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
