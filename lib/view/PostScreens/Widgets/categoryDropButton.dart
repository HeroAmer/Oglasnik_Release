import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/custom2_dropdown.dart'
    as custom2;

class CategoryDropButton extends StatefulWidget {
  const CategoryDropButton({
    Key key,
  }) : super(key: key);

  @override
  _CategoryDropButtonState createState() => _CategoryDropButtonState();
}

class _CategoryDropButtonState extends State<CategoryDropButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Margin().symmetric(3, 9),
      child: Card(
        elevation: 16,
        child: Container(
          margin: Margin().only(0, 0, 2, 5),
          child: Center(
            child: Align(
              alignment: Alignment.topRight,
              child: custom2.DropdownButton<String>(
                value: createSwitcher
                    ? dropdownValueBrand
                    : updateDropdownValueBrand,
                disabledHint: Text('Molimo odaberite kategoriju'),
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
                onChanged: (String productBrandList) => setState(() {
                  if (createSwitcher)
                    dropdownValueBrand =
                        productBrandList; // u productBrandList treba povući vrijednosti iz Firestora ali imajući u vidu kategoriju koja se odabere (prvi brand iz kategorije)
                  else
                    updateDropdownValueBrand = productBrandList;
                }),
                items: List<String>.from(categoryBrands[createSwitcher
                        ? dropdownValueCategory
                        : updateDropdownValueCategory])
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
