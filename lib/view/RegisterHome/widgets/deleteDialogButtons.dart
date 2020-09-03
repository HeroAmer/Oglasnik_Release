import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/material.dart';

class DeleteButtonDialog extends StatefulWidget {
  const DeleteButtonDialog({
    Key key,
    this.snapshot,
  }) : super(key: key);
  final Product snapshot;

  @override
  _DeleteButtonDialogState createState() => _DeleteButtonDialogState();
}

class _DeleteButtonDialogState extends State<DeleteButtonDialog> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
        color: Colors.white,
        child: Text(
          SuccessAlertDialog().delete,
          style: TextStyle(
              color: Color.fromARGB(255, 226, 11, 48),
              fontFamily: 'Roboto',
              fontSize: 14),
        ),
        onPressed: () async {
          await UpdateProduct().updateProduct(
              widget.snapshot.productID, widget.snapshot.productName);
          myProductList.remove(widget.snapshot.productID);
          Navigator.of(context).pushAndRemoveUntil(
              FadeRoute(page: RegisteredHome()),
              (Route<dynamic> route) => false);
        });
  }
}

class OdustaniButtonDialog extends StatelessWidget {
  const OdustaniButtonDialog({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
        color: Colors.white,
        child: Text(
          SuccessAlertDialog().odustani,
          style: TextStyle(
              color: Color.fromARGB(255, 226, 11, 48),
              fontFamily: 'Roboto',
              fontSize: 14),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }
}
