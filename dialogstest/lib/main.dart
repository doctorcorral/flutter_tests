import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: stfw(),
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
      child: bod(context),
    );
  }
}

Widget bod(context) {
  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
              title: Container(
                  color: Colors.amber,
                  padding: EdgeInsets.all(10.0),
                  child: Text("dialogalert")),
              content: Text("dialogcontent"),
              actions: <Widget>[
                FlatButton(
                    child: Text("cerrar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  return Scaffold(
      body: Container(
    child: SafeArea(
        child: Column(
      children: <Widget>[
        Text("wtf"),
        FlatButton(
            child: Text("picalewe"),
            onPressed: () {
              _showDialog();
            })
      ],
    )),
  ));
}
