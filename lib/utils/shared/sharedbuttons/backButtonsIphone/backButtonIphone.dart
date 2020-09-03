//back button for ios //route AnonymousHome
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

IconButton backButtonIphone(BuildContext context) {
  return IconButton(
      icon: Icon(
        Icons.clear,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
          FadeRoute(page: AnonymousHome()), (Route<dynamic> route) => false));
}
