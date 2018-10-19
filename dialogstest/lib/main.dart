import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home:  stfw(),
    );
  }
}
class stfw extends StatefulWidget {
  _nameState createState() => _nameState();
}

class _nameState extends State<stfw> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: bod(),
    );
  }
}

Widget bod() {
  return Scaffold( 
     body: Container(
     child: Text("wtf"),
  ));
}