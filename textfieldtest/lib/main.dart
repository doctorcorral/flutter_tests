import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.grey,
      ),
      home:  Scaffold(body: TextFielder())
      
    );
  }
}

class TextFielder extends StatefulWidget {
  _TextFielderState createState() => _TextFielderState();
}

class _TextFielderState extends State<TextFielder> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: <Widget>[ 
           Text("Yaaay", style: TextStyle(fontSize: 34.0),),
           TextField(onChanged: (s) => print(s))
           ],
        
    ));
  }
}