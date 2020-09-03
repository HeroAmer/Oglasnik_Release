import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class OglasTag extends StatelessWidget {
  final String naziv;
  const OglasTag({Key key, this.naziv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Margin().only(1, 2, 0, 3),
      child: Text(
        // Task radio Elvir. Code handluje unos tagova na inputu to jest, ako korisnik unese sljedece:
        // tag, #tag, ##tag to ce se prikazati kao: #tag #tag #tag
        (naziv.contains('#'))
            ? naziv.replaceFirst('##', '#')
            : "#" + naziv.replaceAll(new RegExp(r"\s+"), ""),
        style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 3,
            fontWeight: FontWeight.w300,
            // Tri nacina dodavanja boje sa prozirnoscu (Elvir)

            //color: Color(0xff254B88).withOpacity(0.54),
            //color: Hexcolor("#254B88").withOpacity(0.54)),
            color: tagsColor.withOpacity(0.54)),
      ),
    );
  }
}
