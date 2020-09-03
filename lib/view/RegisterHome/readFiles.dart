import 'package:Oglasnik/utils/margins.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Image buildImageWidget(String imagePath) {
  return Image.asset(imagePath);
}

class Citanje extends StatefulWidget {
  @override
  _CitanjeState createState() => _CitanjeState();
}

class _CitanjeState extends State<Citanje> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: Margin().all(50),
        child: StreamBuilder(
          stream: Firestore.instance.collection('products').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                child: Card(
                  elevation: 8,
                  color: Colors.white,
                  child: Text('No Items'),
                ),
              );
            }
            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (_, int index) {
                    return Container(
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Text('Name: ' +
                                snapshot.data.documents[index]['email']),
                            Text('Faction: ' +
                                snapshot.data.documents[index]
                                    ['productCategory']),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
