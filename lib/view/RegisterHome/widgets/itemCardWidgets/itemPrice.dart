import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemPrice extends StatelessWidget {
  final String price;
  const ItemPrice({
    Key key,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Margin().only(1, 0, 0, 0),
      child: Text(
        NumberFormat.currency(locale: 'eu', symbol: 'KM').format(
          (double.parse('${price.toString().replaceAll(',', '.')}')),
        ),
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 5,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
