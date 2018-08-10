import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(
    title: "modelogger app",
    home: ModelList(),
  ));
}

class ModelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListView.builder(
        itemExtent: 80.0,
        itemCount: 3,
        itemBuilder: (context, i) => Text("$i"),
      ),
    );
  }
}
