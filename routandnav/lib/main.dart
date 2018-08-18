import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Screen1(),
    routes: <String, WidgetBuilder>{
      '/screen1': (BuildContext context) => Screen1(),
      '/screen2': (BuildContext context) => Screen3()
    },
  ));
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 1"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                button1(context); // 5
              },
              child: Text("Go to Screen 2"),
            )
          ],
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scrin 3"),
        ),
        body: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => button2(context),
                  child: Text("Botoncitu"),
                ),
              ]),
        ));
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 2"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                button2(context);
              },
              child: Text("Back to Screen 1"),
            )
          ],
        ),
      ),
    );
  }
}

void button1(BuildContext context) {
  print("Button 1"); //1
  Navigator.of(context).pushNamed('/screen2'); //2
}

void button2(BuildContext context) {
  print("Button 2"); //3
  Navigator.of(context).pop(true); //4
}
