import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/mainbody.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/bottomSheet.dart';
import 'package:Oglasnik/view/RegisterHome/pages/searchPage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/mainFloatingButton.dart';
import 'package:Oglasnik/viewModel/EditingUser/editUserViewModel.dart';
import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';
import '../../../utils/shared/globalVariables.dart';
import '../../../viewModel/PreviewProduct/previewProduct.dart';

class RegisteredHome extends StatefulWidget {
  @override
  _RegisteredHomeState createState() => _RegisteredHomeState();
}

class _RegisteredHomeState extends State<RegisteredHome> {
  final keyIsFirstLoaded = 'is_first_loaded';
  @override
  void initState() {
    super.initState();
    registeredShowDialog(context);
    createdShowDialog(context);
  }

  List<dynamic> products = [];
  @override
  Widget build(BuildContext context) {
    setState(() {
      isLoading = false;
      doesPop = true;
    });
    EditProfile().isEmailReserved(email);
    allProducts.clear();
    ProductViewModel().getProducts().then((value) => allProducts = value);

    loadingGlob = false;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text(
          RegistereHomePages().naslov,
          style: TextStyle(
            fontFamily: 'Amaranth',
          ),
        ),
        leading: Icon(Icons.accessibility_new, color: mainAppColor),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      floatingActionButton:
          email != null ? MainFloatingButton() : homeFloatingAnimatedButton(),
      bottomSheet: BottomSheetContainer(),
      body: MainBody(),
    );
  }
}
