import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

renderDynamicChips(BuildContext context, dynamicChipPressed) {
  return Container(
    margin: Margin().only(0, 0, 0, 6),
    child: Row(
      children: List<Widget>.generate(citysuggestions.length, (int index) {
        return Container(
          margin: Margin().only(0, 0, 2, 0),
          child: ActionChip(
            label: Text(
              citysuggestions[index],
              style: TextStyle(
                color: textDynamicChip,
              ),
            ),
            backgroundColor: backgroundDynamicChip,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(14),
            )),

            /// Ovaj dio koda radili : Iva i Amer
            /// na onPressed , uzimamo element iz liste citysuggestions i dodajemo ga u listu selectedChips, na taj
            /// način pratimo koliko je user izabrao gradova.
            onPressed: () {
              if (selectedChips.length < 3) {
                selectedChips.add(citysuggestions[index]);
                citysuggestions.removeAt(index);
                dynamicChipPressed();
              } else {
                Flushbar(
                  /// Ovaj task radili su Amer i Faruk.
                  ///
                  /// Flushbar is some kind of snackbar that is showed in the bottom of the screen and display (in this case) an error and display a warning to the user
                  /// Once when user select 3 cities and try to add more in filter, code bellow will be triggered
                  title: FilterFlush().naslov,
                  //message: "Ne moze biti vise od 3 odabrana grada",
                  isDismissible: false,
                  animationDuration: Duration(milliseconds: 800),
                  blockBackgroundInteraction: true,
                  icon: Icon(
                    Icons.error,
                    size: 34,
                    color: Colors.white,
                  ),
                  backgroundColor: mainAppColor,
                  barBlur: 10,

                  duration: Duration(seconds: 3),
                  flushbarPosition: FlushbarPosition.BOTTOM,
                  boxShadows: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 3.0,
                    )
                  ],
                  progressIndicatorBackgroundColor: Colors.blue,
                  shouldIconPulse: true,
                  messageText: Text(
                    FlushBarText().message,
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  flushbarStyle: FlushbarStyle.FLOATING,
                  borderRadius: 30.0,
                )..show(context);
              }
            },
          ),
        );
      }),
    ),
  );
}
