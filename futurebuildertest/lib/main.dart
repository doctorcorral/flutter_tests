import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _switchValue;

  @override
  void initState() {
    super.initState();
    this._switchValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Switch(
            value: this._switchValue,
            onChanged: (newValue) {
              setState(() {
                this._switchValue = newValue;
              });
            },
          ),
          FutureBuilder(
              future: this._fetchData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    return Center(child: Text(snapshot.data));
                }
              }),
        ],
      ),
    );
  }

  _fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return 'REMOTE DATA';
  }
}
