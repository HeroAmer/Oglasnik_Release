import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardDescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

Container itemCardBodyDesc(DocumentSnapshot snapshot) {
  return Container(
    width: SizeConfig.blockSizeHorizontal * 53,
    margin: Margin().only(0, 0, 2, 0),

    ///Fahrudin
    ///
    ///gledamo da li je duzina opisa nekog artikla manja od 150, u slucaju da
    ///jeste onda ga jednostavno ispisujemo u item card-u. Ako nije onda gledamo da li u
    ///podstringu (0,150) postoji tacka. Ukoliko postoji
    ///uzimamo onoliko karaktera na kojoj je poziciji zadnja tacka u
    ///podstringu od 150 karaktera kompletnog opisa, uklanjamo whitespace-ove
    ///i dodajemo mu ... na kraj. Ukoliko nema tacke u prvih 150 karaktera opisa, onda
    ///ispisemo prvih 150 karaktera i dodamo ...
    child: snapshot['productDesc'].toString().trim().length < 150
        ? itemCardDescription(snapshot['productDesc'])
        : snapshot['productDesc']
                .toString()
                .trim()
                .substring(0, 150)
                .contains('.')
            ? itemCardDescription(snapshot['productDesc']
                    .toString()
                    .substring(
                        0,
                        snapshot['productDesc']
                            .toString()
                            .substring(0, 150)
                            .lastIndexOf('.'))
                    .trim() +
                "...")
            : itemCardDescription(
                snapshot['productDesc'].toString().substring(0, 150) + '...',
              ),
  );
}
