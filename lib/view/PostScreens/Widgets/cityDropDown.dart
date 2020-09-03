import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/custom_dropdown.dart'
    as custom;

class CityDropDown extends StatefulWidget {
  const CityDropDown({
    Key key,
    @required this.productSnapshot,
  }) : super(key: key);
  final Product productSnapshot;
  @override
  _CityDropDownState createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: Margin().symmetric(0, 9),
      child: Card(
        elevation: 16,
        child: Container(
          margin: Margin().only(0, 0, 2, 5),
          child: Center(
            child: Align(
              alignment: Alignment.topRight,
              child: custom.DropdownButton<String>(
                value: createSwitcher
                    ? dropdownValueCity
                    : updateDropdownValueCity,
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
                onChanged: (String newValue) {
                  setState(() {
                    if (createSwitcher)
                      dropdownValueCity = newValue;
                    else
                      updateDropdownValueCity = newValue;
                  });
                },
                items: citysuggestions.map<custom.DropdownMenuItem<String>>(
                    (String productCityValue) {
                  return custom.DropdownMenuItem<String>(
                    value: productCityValue,
                    child: Text(productCityValue),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
