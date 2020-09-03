import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemImage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ItemImage itemCardImage(DocumentSnapshot snapshot) {
  return ItemImage(
      img: (snapshot['productImg1'] != null)
          ? snapshot['productImg1']
          : (snapshot['productImg2'] != null)
              ? snapshot['productImg2']
              : (snapshot['productImg3'] != null)
                  ? snapshot['productImg3']
                  : "");
}
