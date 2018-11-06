import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'add items Demo',
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'add items demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> widgetslist = [Text("un item",style: TextStyle(fontSize: 25.0),),
  Text("otro item", style: TextStyle(fontSize: 25.0),)];

  void _incrementCounter() {
    setState(() {
      widgetslist.add(Text("otro item", style: TextStyle(fontSize: 25.0),));
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(

        title: new Text(widget.title),
      ),
      body: new Center(

        child:  columna(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget columna() {
    return ListView(
         // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(child: Text("👽",textAlign: TextAlign.center, style: TextStyle(fontSize: 65.0  ,),), width: 60.0, height: 60.0),
             Text(
              '...',
            ),
             Text(
              'Texto random',
              style: TextStyle(fontSize: 40.0),
              
            ),
      Card(child: Text('Aquí vienen ${widgetslist.length} items'),),
          ] + widgetslist  + [Card(child: Text("Mas contenido equis", style: TextStyle(fontSize: 17.0)))],
        );
  }
  
}

