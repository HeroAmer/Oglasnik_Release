import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/smallMainButton.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/anonProductDetailsTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsCategory.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsContactsWidget.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsDeleteAlertDialog.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsDesc.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsLocation.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsTagsAndStar.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/ProductDetails/productDetailsViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/showimage.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    Key key,
    @required this.widget,
    @required this.imageSlider,
  }) : super(key: key);

  final ProductDetails widget;
  final List imageSlider;

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firestore.instance
          .collection('products')
          .where('productID', isEqualTo: widget.widget.productIdScreen)
          .getDocuments(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          ProductDetailsViewModel()
              .initImageSlider(snapshot, widget.imageSlider);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                            color: Colors.black26,
                            width: 0.2,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        margin: Margin().symmetric(5, 5),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0x40080808), width: 0.8),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0)),
                                ),
                                width: SizeConfig.screenWidth,
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  child: CarouselSlider(
                                    enableInfiniteScroll: false,
                                    initialPage: 0,
                                    viewportFraction: 1.0,
                                    aspectRatio: 1.5,
                                    items: widget.imageSlider.map((imgUrl) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                            child: GestureDetector(
                                              child: imgUrl ==
                                                      "assets/images/nophoto.jpg"
                                                  ? Image.asset(
                                                      "assets/images/nophoto.jpg")
                                                  : CachedNetworkImage(
                                                      imageUrl: imgUrl,
                                                      placeholder:
                                                          (context, url) =>
                                                              SpinnerCircular(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          new Icon(Icons.error),
                                                    ),
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  FadeRoute(
                                                    page: PrikazSlika(
                                                      listaSlika:
                                                          widget.imageSlider,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              productDetailsLocationWidget(index),
                              Container(
                                margin: Margin().only(1.1, 0, 3, 5),
                                child: Row(children: <Widget>[
                                  Container(
                                    width: 170.0,
                                    child: Text(
                                      widget.widget.productNameScreen,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                                  Spacer(),
                                  productDetailsCategoryWidget(index)
                                ]),
                              ),
                              productDetailsDescWidget(index),
                              Divider(
                                thickness: SizeConfig.blockSizeVertical * 0.2,
                                indent: 15,
                                endIndent: 15,
                              ),
                              //extract
                              email != null
                                  ? ProductDetailsTagsAndStar(
                                      index: index,
                                      docs: snapshot.data.documents,
                                    )
                                  : anonProductDetailsTagsWidget(index),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  products[index].email == email
                      ? Container(
                          margin: Margin().only(0, 15, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              smallMainButton(UserProducts().editProfile,
                                  //extract
                                  () {
                                ProductDetailsViewModel()
                                    .onUpdatePressed(context, index);
                              }),
                              smallMainButton(UserProducts().finishProduct,
                                  //extract
                                  () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ProductDetailsDeleteAlertDialog(
                                        index: index,
                                      );
                                    });
                              }),
                            ],
                          ),
                        )
                      : Stack(children: <Widget>[
                          ProductDetailsContactsWidget(
                            index: index,
                          ),
                        ]),
                ],
              );
            },
          );
        } else {
          return Center(
            child: SpinnerCircular(),
          );
        }
      },
    );
  }
}
