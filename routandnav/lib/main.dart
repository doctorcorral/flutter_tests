import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  // 1
  runApp(// 2
      new MaterialApp(
    debugShowCheckedModeBanner: false,

    //3
    home: Screen1(), //4
    routes: <String, WidgetBuilder>{
      //5
      '/screen1': (BuildContext context) => Screen1(), //6
      '/screen2': (BuildContext context) => Screen2() //7
    },
  ));
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1
      appBar: AppBar(
        //2
        title: Text("Screen 1"),
      ),
      body: Center(
        // 3
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                // 4
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
