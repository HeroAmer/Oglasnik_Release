import 'package:Oglasnik/view/AnonymousHome/pages/mainbody.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/bottomSheet.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/pages/searchPage.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewProduct.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/mainFloatingButton.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

class AnonymousHome extends StatefulWidget {
  @override
  _AnonymousHomeState createState() => _AnonymousHomeState();
}

class _AnonymousHomeState extends State<AnonymousHome> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    allProducts.clear();
    ProductViewModel().getProducts().then((value) => allProducts = value);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: AppBarTheme.of(context).color,
          centerTitle: true,
          title: Text(
            'Oglasnik',
            style: TextStyle(
              fontFamily: 'Amaranth',
            ),
          ),
          leading: Container(),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            )
          ],
        ),
        body: MainBody(),
        floatingActionButton:
            email != null ? MainFloatingButton() : homeFloatingAnimatedButton(),
        bottomSheet: BottomSheetContainer(),
      ),
    );
  }
}
