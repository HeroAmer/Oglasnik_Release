import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedvalidation/tokenandpassValidation/tokenValidator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnesiKod extends StatelessWidget {
  const UnesiKod({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10),
      child: new SizedBox(
        width: double.infinity,
        child: Container(
          child: TextFormField(
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (v) {
              FocusScope.of(context).nextFocus();
            },
            inputFormatters: [
              new BlacklistingTextInputFormatter(RegExp(
                  '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
            ],
            decoration: InputDecoration(
              hintText: 'Unesi kod',
              contentPadding: EdgeInsets.only(left: 10),
            ),
            initialValue: passwordChangedToken,
            onChanged: (value) => passwordChangedToken = value,
            validator: tokenValidator,
          ),
        ),
      ),
    );
  }
}
