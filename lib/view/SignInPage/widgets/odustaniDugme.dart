import 'package:Oglasnik/viewModel/SignIn/signInViewModel.dart';
import 'package:flutter/material.dart';

class OdustaniDugme extends StatelessWidget {
  const OdustaniDugme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
        color: Color.fromARGB(255, 226, 11, 48),
        child: Text(
          'ODUSTANI',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Roboto', fontSize: 14),
        ),
        onPressed: () {
          alerDialogOnPressedOdustani(context);
        },
      ),
    );
  }
}
