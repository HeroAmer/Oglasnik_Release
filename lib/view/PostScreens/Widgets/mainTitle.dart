import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    Key key,
    @required this.editProduct,
  }) : super(key: key);
  final String editProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              editProduct,
              style: TextStyle(fontFamily: "Roboto", fontSize: 20),
            ),
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
