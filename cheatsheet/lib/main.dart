import 'package:flutter/material.dart';
import 'package:cheatsheet/widgets.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.grey,
      home: appBody(context),
    );
  }
}

Widget appBody(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('👅'), backgroundColor: Colors.white70),
      body: SafeArea(
        child: Container(
          color: Colors.amber[100],
          child: sizedbox3(),
        ),
      ));
}
