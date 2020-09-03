import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/registerValidation/phoneValidator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        new BlacklistingTextInputFormatter(
          RegExp(
              '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        ),
      ],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        hintText: 'Broj telefona',
      ),

      initialValue: registerPhoneNumber,
      onChanged: (value) => registerPhoneNumber = value,
      keyboardType: TextInputType.phone,
      validator: phoneValidator,
      textInputAction: TextInputAction.done,
      // focusNode: phonenode,
      onFieldSubmitted: (v) {
        FocusScope.of(context).unfocus();
        //  _calculator();
      },
    );
  }
}

Container phoneNumberInputField(BuildContext context) {
  return new Container(
    margin: EdgeInsets.only(bottom: 30),
    child: new SizedBox(
      width: double.infinity,
      child: Container(
        child: PhoneTextField(),
      ),
    ),
  );
}
