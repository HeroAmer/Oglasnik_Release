import 'package:flutter/material.dart';
import '../../../../../utils/strings.dart';

GridView productBrandImages(AsyncSnapshot snapshot, List<int> indexi) {
  return new GridView.count(
    padding: EdgeInsets.all(0),
    physics: new NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    childAspectRatio: 1,
    crossAxisSpacing: 3,
    mainAxisSpacing: 3,
    children: <Widget>[
      Image.network(
        indexi.length < 1 ? noPhotoNetwork : snapshot.data[indexi[0]],
        fit: BoxFit.cover,
      ),
      Image.network(
        indexi.length < 2 ? noPhotoNetwork : snapshot.data[indexi[1]],
        fit: BoxFit.cover,
      ),
      Image.network(
        indexi.length < 3 ? noPhotoNetwork : snapshot.data[indexi[2]],
        fit: BoxFit.cover,
      ),
      Image.network(
        indexi.length < 4 ? noPhotoNetwork : snapshot.data[indexi[3]],
        fit: BoxFit.cover,
      ),
    ],
    shrinkWrap: true,
  );
}
