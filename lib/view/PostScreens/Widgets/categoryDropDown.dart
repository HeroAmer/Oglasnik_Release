import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/custom_dropdown.dart'
    as custom;

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({
    Key key,
  }) : super(key: key);

  @override
  _CategoryDropDownState createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Margin().symmetric(0, 9),
      child: Card(
          elevation: 16,
          child: Container(
              margin: Margin().only(0, 20, 2, 5),
              child: Center(
                  child: Align(
                      alignment: Alignment.topRight,
                      child: custom.DropdownButton<String>(
                        value: dropdownValueCategory,
                        key: productCategoryDropDownKey,
                        height: MediaQuery.of(context).size.height / 2.229,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                          height: 1.5,
                        ),
                        underline: Container(),
                        onChanged: (String productCategoryList) =>
                            setState(() => {
                                  dropdownValueCategory = productCategoryList,
                                  dropdownValueBrand =
                                      categoryBrands[dropdownValueCategory][0],
                                }),
                        items: categoryNames
                            .map<custom.DropdownMenuItem<String>>(
                                (String value) {
                          return custom.DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))))),
    );
  }
}
