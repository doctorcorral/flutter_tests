import 'package:flutter/material.dart';

Widget rowTest() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
    ],
  );
}

Widget rowTestSpaceBetween() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
    ],
  );
}

Widget rowTestSpaceEvenly() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
    ],
  );
}
