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
        home: Scaffold(body: TextFielder()));
  }
}

class TextFielder extends StatefulWidget {
  _TextFielderState createState() => _TextFielderState();
}

class _TextFielderState extends State<TextFielder> {
  TextEditingController controller = TextEditingController();
  FocusNode nodeOne = FocusNode();
  FocusNode nodeTwo = FocusNode();
  bool nodeOneOn = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: Column(
      children: <Widget>[
        Text(
          "Yaaay",
          style: TextStyle(fontSize: 34.0),
        ),
        TextField(
          autofocus: true,
          focusNode: nodeOne,
          controller: controller,
          onChanged: (val) {
            print(controller.text);
          },
          onEditingComplete: () {
            print('Yeah ${controller.text}');
          },
          onSubmitted: (v) {
            print('ahsuma $v');
          },
        ),
        TextField(
          focusNode: nodeTwo,
          onEditingComplete: () {
            print('Yeah ${controller.text}');
          },
          onSubmitted: (v) {
            print('ahsuma $v');
          },
        ),
        RaisedButton(
          onPressed: () {
            nodeOneOn = ! nodeOneOn;
            FocusScope.of(context).requestFocus( nodeOneOn ? nodeOne : nodeTwo) ;
          },
          child: Text("cambia texto"),
        )
      ],
    )));
  }
}
