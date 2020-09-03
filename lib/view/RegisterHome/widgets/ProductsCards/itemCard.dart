import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/searchPage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardBody.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/mainFloatingButton.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';

class ItemCard extends StatefulWidget {
  //String audi = "assets/images/audi.jpg";
  final String brandNameScreen;
  final String categoryName;
  ItemCard(
      {Key key, @required this.brandNameScreen, @required this.categoryName})
      : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  // ignore: override_on_non_overriding_member
  void justSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(favoritesList);
    //getFavoriteProducts(email);
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(FadeRoute()),
          ),
          backgroundColor: AppBarTheme.of(context).color,
          centerTitle: true,
          title: Text(widget.brandNameScreen),
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
        bottomSheet: Container(
          height: 55,
          width: double.infinity,
          color: Color.fromARGB(255, 226, 11, 48),
        ),
        body: ItemCardBody(
          widget: widget,
          categoryName: widget.categoryName,
          setStateParent: justSetState,
        ));
  }
}
