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
      color: Colors.blueGrey,
      child: StreamBuilder(
          stream: Firestore.instance.collection('modelsmetainfo').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              print("${snapshot.data.documents[0]}");
              return Text("cargando...");
            }
            return ListView.builder(
                itemExtent: 80.0,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, i) =>
                    _buildListItem(context, snapshot.data.documents[i]));
          }),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Card(child: Text(document['name']));
  }
}
