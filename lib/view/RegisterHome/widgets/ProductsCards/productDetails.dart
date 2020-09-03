import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsWidget.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/mainFloatingButton.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';

class ProductDetails extends StatefulWidget {
  final String productNameScreen;
  final String productIdScreen;
  final Function setStateParent;
  ProductDetails({
    Key key,
    @required this.productNameScreen,
    @required this.productIdScreen,
    @required this.setStateParent,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // ignore: unused_field
  int _selectedIndex;
  // ignore: unused_element
  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List imageSlider = [];
  @override
  Widget build(BuildContext context) {
    print(favoritesList);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text(widget.productNameScreen),
        leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              if (widget.setStateParent != null) {
                widget.setStateParent();
              }
              Navigator.of(context).pop(FadeRoute());
            }),
      ),
      floatingActionButton:
          email != null ? MainFloatingButton() : homeFloatingAnimatedButton(),
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: bottomSheetColor,
      ),
      body: WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          if (widget.setStateParent != null) {
            widget.setStateParent();
          }
          Navigator.of(context).pop(FadeRoute());
        },
        child: ProductDetailsWidget(widget: widget, imageSlider: imageSlider),
      ),
    );
  }
}

//extract
class CallsAndMessagesService {
  void call(String number) => launch("tel:$number");
}
