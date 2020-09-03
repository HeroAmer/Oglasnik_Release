import 'package:Oglasnik/view/AnonymousHome/widgets/prijavaButton.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/registracijaButton.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

Stack homeFloatingAnimatedButton() {
  return Stack(overflow: Overflow.visible, children: <Widget>[
    Builder(
      builder: (context) => FabCircularMenu(
        alignment: Alignment.bottomRight,
        ringColor: Colors.grey[50].withAlpha(210),
        ringDiameter: 350.0,
        ringWidth: 76.0,
        fabColor: Colors.white,
        fabOpenIcon: Icon(
          Icons.person,
          color: Color.fromARGB(255, 226, 11, 48),
        ),
        fabCloseIcon: Icon(
          Icons.close,
          color: Color.fromARGB(255, 226, 11, 48),
        ),
        fabMargin: const EdgeInsets.only(bottom: 24.0, right: 20.0),
        children: <Widget>[PrijavaButton(), RegistracijaButton()],
      ),
    ),
  ]);
}
