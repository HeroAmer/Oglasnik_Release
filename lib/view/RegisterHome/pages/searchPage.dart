import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/bottomSheet.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/productSearch.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/mainFloatingButton.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';

class DataSearch extends SearchDelegate<String> {
// Iva i Elvir, promjena teksta na search baru +
  ///dodatne promjene u search biblioteci searchdelegate klase.Sve promjene vezane za dizajn su u biblioteci.
  /// U narednim linijama code-a (200, 209) u searchu.dart biblioteka moralo je doci do izmjena da bi search bar bio u skladu sa nasom aplikacijom
  /// Izmjene su se morale odraditi direktno u klasi SearchDelegate
  /// Izmjene se ticu promjene boje bara, boje ikona, boje title-a
  /// Plus izmjena boje kursora na liniji 538
  /// promjena vrijednosti varijable na 203 liniji jer ThemeData povlaci vrijednosti
  /// iz biblioteke theme_data.dart, a kako nismo smijeli dirati izmjene te biblioteke morali smo odraditi drugacije
  /// Task radili: Elvir i Iva
  @override
  List<Widget> buildActions(BuildContext context) {
    citysuggestions.addAll(selectedChips);
    selectedChips.clear();
    return [
      IconButton(
        icon: Icon(Icons.clear),
        color: Colors.white,
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        color: Colors.white,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ///Na ovom dijelu koda (buildResults) su radili : Faruk, Fahrudin i Amer
    ///OPIS LOGIKE: Kao što vidimo , definisane su dvije liste : products i selectedProducts.
    ///Ove dvije liste ćemo koristiti kako bi useru prikazali artikle koje on pretražuje na način da
    ///ćemo u listi products imati storane naše proizvode iz baze, a u listu selectedProduct ćemo puniti na osnovu toga šta
    ///user ukuca u search, te na osnovu te liste ćemo prikazivati željene produkte na screen.

    return Scaffold(
      floatingActionButton:
          email != null ? MainFloatingButton() : homeFloatingAnimatedButton(),
      bottomSheet: BottomSheetContainer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SearchPageFutureBuilder(query: query),
          ),
        ],
      ),
    );
  }

  Widget buildSuggestions(BuildContext context) {
    ///Faruk Cidic
    ///
    ///Since user will receive suggestions after 3 characters, we are bellow setting statemant suitable
    ///for that request. Also, we are showing him products without taking care about LowerCase or UpperCase
    ///
    ///If user starts to type and decide to select something from our suggestionList, on the next screen
    ///in appbar (searchbar), selectedProduct name will be written.
    ///
    ///UPDATE!
    ///
    ///Nakon što je donešena odluka da se u kroz search može pretraživati i brendovi (pored naziva
    ///proizvoda), potrebno je bilo i modificirati listu sugestija. Pa smo tako listi
    ///
    productsAndBrandList = [
      ...{...productsForSearch}
    ];

    //extract Faruk
    if (query.length > 2) {
      suggestionsList = productsAndBrandList
          .where((e) => e.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            query = suggestionsList[index];
            showResults(context);
          },
          title: RichText(
            text: TextSpan(
                text: suggestionsList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: suggestionsList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ]),
          ),
        ),
        itemCount: suggestionsList.length,
      );
    } else
      return Container();
  }
}
