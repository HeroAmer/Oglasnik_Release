import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:flutter/material.dart';

class ActionChipsWidget extends StatefulWidget {
  const ActionChipsWidget(
    // ignore: invalid_required_positional_param
    @required this.actionChipDeleted,
  );
  @override
  // ignore: override_on_non_overriding_member
  final VoidCallback actionChipDeleted;
  _ActionChipsWidgetState createState() => _ActionChipsWidgetState();
}

class _ActionChipsWidgetState extends State<ActionChipsWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    ///Iva i Elvir , sortiranje čipova za odabrane čipove i čipove iz liste,
    ///pomoću sortiranja čipovi se nakon sto su obrisani vrate na svoje prvobitne pozicije u listi
    selectedChips.sort();
    return Container(
      margin: Margin().only(0, 0, 0, 6),
      child: Row(
        children: List<Widget>.generate(selectedChips.length, (index) {
          return Container(
            margin: Margin().only(0, 0, 2, 0),
            child: Chip(
              label: Text(
                selectedChips[index],
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.34),
                ),
              ),
              backgroundColor: Color.fromRGBO(226, 11, 48, 0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(14),
              )),

              /// Fahrudin i Elvir, brisanje chipova kada ne zelimo vise taj chip u nasem filteru
              /// Funkcija brise chipove iz rowa i vraca ga u prvobitno stanje
              deleteIconColor: Color.fromRGBO(0, 0, 0, 0.54),
              onDeleted: () {
                /*
                setState(() {
                  
                });*/
                citysuggestions.add(selectedChips[index]);
                selectedChips.removeAt(index);
                widget.actionChipDeleted();
              },
            ),
          );
        }),
      ),
    );
  }
}
