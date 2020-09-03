import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/oznakeTextField.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class TagsForm extends StatelessWidget {
  const TagsForm({
    Key key,
    @required this.productSnapshot,
  }) : super(key: key);
  final Product productSnapshot;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Container(
          margin: Margin().only(3, 14.5, 10, 10),
          child: Form(
              key: productTagFormKey,
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.black54,
                  errorColor: Colors.red,
                ),
                child: OznakeTextField(productSnapshot: productSnapshot),
              )),
        ),
      ],
    );
  }
}
