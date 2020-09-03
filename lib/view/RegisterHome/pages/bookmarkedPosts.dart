import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/bottomSheet.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/myFavorites.dart';
import 'package:flutter/material.dart';

class BookmarkedPosts extends StatefulWidget {
  @override
  _BookmarkedPostsState createState() => _BookmarkedPostsState();
}

class _BookmarkedPostsState extends State<BookmarkedPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text(Titles().myFavorites),
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context)
              .pushReplacement(FadeRoute(page: RegisteredHome())),
        ),
      ),
      body: WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          Navigator.of(context).pushReplacement(
            FadeRoute(page: RegisteredHome()),
          );
        },
        child: MyFavorites(),
      ),
      floatingActionButton:
          email != null ? MainFloatingButton() : homeFloatingAnimatedButton(),
      bottomSheet: BottomSheetContainer(),
    );
  }
}
