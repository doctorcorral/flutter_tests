import 'package:flutter/material.dart';
import 'package:cheatsheet/widgets.dart';

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
    child: rowTestSpaceEvenly(),
  ));
}
