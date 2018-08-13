//package 'rcc.flutter.modelogger';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "modelogger app",
    home: ModelList(),
  ));
}

class ModelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white10,
      child: StreamBuilder(
          stream: Firestore.instance.collection('modelsmetainfo').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text("cargando...");
            return ListView.builder(
              itemExtent: 80.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, i) => Text("$snapshot.data.documents[i]"),
            );
          }),
    );
  }
}
