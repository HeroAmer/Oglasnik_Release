import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/bottomSheet.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/myProducts.dart';
import 'package:flutter/material.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({Key key, this.email}) : super(key: key);
  final String email;
  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    print('korisnik prijavljen sa: ' + widget.email.toString() + ' emailom');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text(Titles().myPosts),
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
          child: MyProducts()),
      floatingActionButton:
          email != null ? MainFloatingButton() : homeFloatingAnimatedButton(),
      bottomSheet: BottomSheetContainer(),
    );
  }
}
