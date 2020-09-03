import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/mojiOglasiButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/sacuvanoButton.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/noviOglasButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/profilButton.dart';

class MainFloatingButton extends StatelessWidget {
  const MainFloatingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Builder(
        builder: (context) => FabCircularMenu(
          alignment: Alignment.bottomRight,
          ringColor: Colors.grey[50].withAlpha(250),
          ringDiameter: 400.0,
          ringWidth: 76.0,
          fabColor: Colors.white,
          fabOpenIcon: Icon(
            Icons.add,
            color: Color.fromARGB(255, 226, 11, 48),
          ),
          fabCloseIcon: Icon(
            Icons.close,
            color: Color.fromARGB(255, 226, 11, 48),
          ),
          fabMargin: const EdgeInsets.only(bottom: 24.0, right: 20.0),
          children: <Widget>[
            Stack(children: <Widget>[
              SacuvanoButton(),
            ]),
            Stack(children: <Widget>[
              MojiOglasiButton(
                email: email,
              ),
            ]),
            Stack(children: <Widget>[
              NoviOglasButton(),
            ]),
            Stack(children: <Widget>[
              ProfilButton(),
            ]),
          ],
        ),
      ),
    ]);
  }
}
