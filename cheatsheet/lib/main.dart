import 'package:flutter/material.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.grey,
      home: appBody(),
    );
  }
}

Widget appBody() {
  return Scaffold(
      body: SafeArea(
    child: rowTestSpaceBetween(),
  ));
}

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
