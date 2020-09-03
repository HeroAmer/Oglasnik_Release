import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async'; 

///Funkcija sluzi za odredjivanje dimenzija neke slike (na osnovu njenog URL-a koji proslijedimo kao parametar).
///Sluzice za odredjivanje kako ce slika biti fit-ovana u container.

Future<Size> calculateImageDimension(String imgUrl) async {
  // kreiranje objekta tipa future koji ce dobiti neku vrijednost ili error
  Completer<Size> completer = Completer();
  //proslijeđeni URL u funkciju
  Image image = Image.network(imgUrl);
  // ignore: await_only_futures
  await image.image.resolve(ImageConfiguration()).addListener(
    ImageStreamListener(
      (ImageInfo image, bool synchronousCall) {
        var myImage = image.image;
        //pripremanje values za completer
        Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
        completer.complete(size);
      },
    ),
  );
  return completer.future;
}
