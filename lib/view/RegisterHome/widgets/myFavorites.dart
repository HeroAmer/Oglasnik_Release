import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/MyFavorites/favoritesContainer.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:flutter/material.dart';

class MyFavorites extends StatefulWidget {
  @override
  _MyFavoritesState createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  @override
  // ignore: override_on_non_overriding_member
  void justSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FavoriteProduct().listAllFavorites(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: SpinnerCircular(),
            ),
          );
        } else {
          favoritesList.clear();
          for (int i = 0; i < snapshot.data.length; i++)
            favoritesList.add(snapshot.data[i]['productID']);
          return Container(
            padding: EdgeInsets.only(bottom: 55),
            child: snapshot.data.length == 0
                ? Center(child: Text("Nemate sacuvanih proizvoda."))
                : ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, int index) {
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            onTapFavorites(
                                context, snapshot, index, justSetState);
                          },
                          child: FavContainer(
                            snapshot: snapshot,
                            index: index,
                          ),
                        ),
                      );
                    }),
          );
        }
      },
    );
  }
}
