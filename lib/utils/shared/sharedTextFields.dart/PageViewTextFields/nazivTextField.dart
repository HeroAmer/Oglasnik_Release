import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/services.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/pageViewValidation/productsFieldsValidator.dart';
import 'package:flutter/material.dart';

class NazivTextField extends StatefulWidget {
  const NazivTextField({
    Key key,
    //@required this.editProduct,
    @required this.productSnapshot,
  }) : super(key: key);
  final Product productSnapshot;
  // final String editProduct;
  @override
  _NazivTextFieldState createState() => _NazivTextFieldState();
}

String newText;

class _NazivTextFieldState extends State<NazivTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: productNameFormKey,
      //autovalidate: true,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.black54,
          errorColor: Colors.red,
        ),
        child: TextFormField(
          autocorrect: false,
          //extract
          initialValue: createSwitcher
              ? newProductNameReturn == null ? "" : newProductNameReturn
              : updateProductNameReturn == null
                  ? updateProductName
                  : updateProductNameReturn,
          onChanged: nazivFieldOnChanged,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          validator: productFieldsValidator,
          maxLength: 28,
          decoration: const InputDecoration(
              hintText: 'Naziv artikla',
              contentPadding: EdgeInsets.only(left: 15.0)),
        ),
      ),
    );
  }
}
