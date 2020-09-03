import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuggestionTitle extends StatelessWidget {
  const SuggestionTitle({
    Key key,
    @required this.index,
    @required this.query,
  }) : super(key: key);

  final String query;
  final int index;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: suggestionsList[index].substring(0, query.length),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: suggestionsList[index].substring(query.length),
                style: TextStyle(color: Colors.grey))
          ]),
    );
  }
}
