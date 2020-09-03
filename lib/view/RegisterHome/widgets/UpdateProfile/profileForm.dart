import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileForm/updateEmailProfile.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileForm/updateNameProfile.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileForm/updatePhoneProfile.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:Oglasnik/viewModel/EditingUser/editUserViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({
    Key key,
  }) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  List<DocumentSnapshot> userInfo = List<DocumentSnapshot>();

  @override
  Widget build(BuildContext context) {
    AuthService().userExistingorNot(updateProfileEmail);
    return Container(
      margin: Margin().only(0, 0, 13, 13),
      child: Form(
        key: updateproductNameFormKey,
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.black54,
            errorColor: Colors.red,
          ),
          child: Column(
            children: <Widget>[
              FutureBuilder(
                  future: EditProfile().getUsersFromdb(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData)
                      return CategoryLoading();
                    else {
                      userInfo = snapshot.data.documents;
                      return Column(
                        children: <Widget>[
                          UpdateName(user: userInfo[0]),
                          UpdateEmail(user: userInfo[0]),
                          UpdatePhone(user: userInfo[0]),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
