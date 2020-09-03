import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/custom2_dropdown.dart'
    as custom2;

class BrandForm extends StatefulWidget {
  const BrandForm({
    Key key,
  }) : super(key: key);

  @override
  _BrandFormState createState() => _BrandFormState();
}

class _BrandFormState extends State<BrandForm> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
      child: Card(
        elevation: 16,
        child: Container(
          margin: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Center(
            child: Align(
              alignment: Alignment.topRight,
              child: custom2.DropdownButton<String>(
                value: dropdownValueBrand,
                key: productBrandFormKey,
                disabledHint: Text('Molimo odaberite kategoriju'),
                height: MediaQuery.of(context).size.height / 2.229,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                isExpanded: true,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  height: 1.5,
                ),
                underline: Container(),
                onChanged: (String productBrandList) => setState(() {
                  dropdownValueBrand = productBrandList;
                }),
                items: List<String>.from(categoryBrands[dropdownValueCategory])
                    .map<custom2.DropdownMenuItem<String>>((String value) {
                  return custom2.DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
