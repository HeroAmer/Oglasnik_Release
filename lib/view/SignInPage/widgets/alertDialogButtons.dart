import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/SignInPage/widgets/odustaniDugme.dart';
import 'package:Oglasnik/view/SignInPage/widgets/posaljiKodDugme.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/material.dart';

class AlertDialogButtons extends StatefulWidget {
  const AlertDialogButtons({
    Key key,
  }) : super(key: key);

  @override
  _AlertDialogButtonsState createState() => _AlertDialogButtonsState();
}

class _AlertDialogButtonsState extends State<AlertDialogButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: Margin().only(0, 0, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OdustaniDugme(),
          Container(
              child:
                  AuthService().tokenExistOrNot(context, forgetEmail, token)),
          PosaljiKodDugme(),
          Container(
            child: AuthService().allowPasswordChange(context, forgetEmail),
          )
        ],
      ),
    );
  }
}
