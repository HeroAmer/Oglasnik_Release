import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/pageViewValidation/productTagValidator.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OznakeTextField extends StatelessWidget {
  const OznakeTextField({
    Key key,
    @required this.productSnapshot,
  }) : super(key: key);
  final Product productSnapshot;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      ////extract
      initialValue: createSwitcher
          ? newProductTagsReturn == null ? "" : newProductTagsReturn
          : updateProductTagsReturn == null
              ? updateProductTags
              : updateProductTagsReturn,
      onChanged: oznakeFieldOnChanged,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
      //controller: productTagController,
      validator: productTagValidation,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
          hintText: 'Oznake',
          helperText:
              'Svaku oznaku morate razdvojiti zarezom.\nPrimjer:prodaja, novo, zamjena, hitno...',
          contentPadding: EdgeInsets.only(left: 10.0)),
    );
  }
}
