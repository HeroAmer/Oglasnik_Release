import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  final String description;
  const ItemDescription({
    Key key,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Margin().only(0, 0, 0, 3),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          description,
          style: TextStyle(color: descOfItem, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
