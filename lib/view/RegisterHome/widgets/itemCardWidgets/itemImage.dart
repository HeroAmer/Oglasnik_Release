import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemImage extends StatefulWidget {
  const ItemImage({
    Key key,
    @required this.img,
  }) : super(key: key);

  final String img;

  @override
  _ItemImageState createState() => _ItemImageState();
}

class _ItemImageState extends State<ItemImage> {
  @override
  Widget build(BuildContext context) {
    return
        //CategoryLoading();
        widget.img == ""
            ? Container(
                margin: Margin().only(1, 0, 1, 0),
                height: SizeConfig.blockSizeVertical * 20,
                width: SizeConfig.blockSizeVertical * 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(noPhoto),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.redAccent,
                ),
              )
            : Container(
                margin: Margin().only(1, 0, 1, 0),
                height: SizeConfig.blockSizeVertical * 20,
                width: SizeConfig.blockSizeVertical * 20,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl: widget.img,
                  placeholder: (context, url) => SpinnerCircular(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              );
  }
}
