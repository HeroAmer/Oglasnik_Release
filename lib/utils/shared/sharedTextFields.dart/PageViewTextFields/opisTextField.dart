import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/pageViewValidation/productDescValidator.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OpisTextField extends StatelessWidget {
  const OpisTextField({
    Key key,
    @required this.productSnapshot,
  }) : super(key: key);
  final Product productSnapshot;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: productDescFormKey,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.black54,
          errorColor: Colors.red,
        ),
        child: TextFormField(
          ////extract
          initialValue: createSwitcher
              ? newProductDescriptionReturn == null
                  ? ""
                  : newProductDescriptionReturn
              : updateProductDescriptionReturn == null
                  ? updateProductDescription
                  : updateProductDescriptionReturn,
          onChanged: opisFieldOnChanged,
          onFieldSubmitted: (v) {
            FocusScope.of(context).nextFocus();
          },
          validator: productDescValidation,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(
            labelText: 'Opis',
            contentPadding: EdgeInsets.only(left: 15.0),
          ),
        ),
      ),
    );
  }
}
