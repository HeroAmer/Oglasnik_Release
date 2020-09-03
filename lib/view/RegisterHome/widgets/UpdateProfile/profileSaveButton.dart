import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/viewModel/EditingUser/changePasswordViewModel.dart';
import 'package:Oglasnik/viewModel/EditingUser/editUserViewModel.dart';
import 'package:flutter/material.dart';

class ProfileSaveButton extends StatelessWidget {
  const ProfileSaveButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: Margin().only(8, 1, 0, 0),
        child: button(
          PasswordChangePage().buttonString,
          () async {
            await EditProfile().isEmailReserved(email);
            EditData().onPressedSaveButton(context);
          },
        ),
      ),
    );
  }
}
