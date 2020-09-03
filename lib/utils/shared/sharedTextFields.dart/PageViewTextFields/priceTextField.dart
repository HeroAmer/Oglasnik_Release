import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/pageViewValidation/productPriceValidator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Container priceTextField() {
  return Container(
      width: 150,
      child: Form(
        // autovalidate: true,
        key: productPriceFormKey,
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.black54,
            errorColor: Colors.red,
          ),
          child: TextFormField(
            initialValue: createSwitcher
                ? newProductPriceReturn == null ? "" : newProductPriceReturn
                : updateProductPriceReturn == null
                    ? updateProductPrice
                    : updateProductPriceReturn,
            onChanged: (value) {
              if (!createSwitcher)
                updateProductPriceReturn = value;
              else
                newProductPriceReturn = value;
            },
            inputFormatters: [
              new BlacklistingTextInputFormatter(RegExp(
                  '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
            ],
            decoration: InputDecoration(
              hintText: 'Cijena',
              contentPadding: EdgeInsets.only(left: 15),
            ),
            keyboardType: TextInputType.phone,
            validator: productPriceValidator,
            //controller: productPriceController,
          ),
        ),
      ));
}
