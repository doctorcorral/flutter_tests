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

Widget rowTestSpaceAround() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
    ],
  );
}

Widget rowTestText(BuildContext context) {
  return Container(
    color: Colors.amber,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          'Baseline',
          style: Theme.of(context).textTheme.display3,
        ),
        Text(
          'Baseline',
          style: Theme.of(context).textTheme.body1,
        ),
      ],
    ),
  );
}

Widget rowTestSizes() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 200.0),
      new Icon(Icons.star, size: 50.0),
    ],
  );
}

Widget botones() {
  return Center(
    child: IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text('Short'),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('A bit Longer'),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('The Longest text button'),
          ),
        ],
      ),
    ),
  );
}
