import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/lightPinkButton.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertDialogWidget.dart';
import 'package:flutter/material.dart';

class ProfileChangePassButton extends StatelessWidget {
  const ProfileChangePassButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Margin().only(4, 0, 0, 12),
      child: lightbutton(
        'Promijeni šifru',
        () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialogWidget();
            },
          );
        },
      ),
    );
  }
}
