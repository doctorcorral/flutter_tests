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
    // return Card(child: Text(document['name']));
    return Container(
      height: 124.0,
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Colors.white70,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0.0, 5.0),
          )
        ],
      ),
      child: Container(
          margin: EdgeInsets.all(5.0),
          child: Text(document['name'],
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w200))),
    );
  }
}
