import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/Chips/renderDynamicChips.dart';
import 'package:flutter/material.dart';

class DynamicChipsWidget extends StatefulWidget {
  const DynamicChipsWidget(
    // ignore: invalid_required_positional_param
    @required this.dynamicChipPressed,
  );
  @override
  // ignore: override_on_non_overriding_member
  final VoidCallback dynamicChipPressed;
  _DynamicChipsWidgetState createState() => _DynamicChipsWidgetState();
}

class _DynamicChipsWidgetState extends State<DynamicChipsWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    ///Iva i Elvir , sortiranje čipova za odabrane čipove i čipove iz liste,
    ///pomoću sortiranja čipovi se nakon sto su obrisani vrate na svoje prvobitne pozicije u listi
    citysuggestions.sort();
    return renderDynamicChips(context, widget.dynamicChipPressed);
  }
}
