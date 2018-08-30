import 'package:flutter/material.dart';

Widget rowTest() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
    ],
  );
}

Widget rowTestSpaceBetween() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
    ],
  );
}

Widget rowTestSpaceEvenly() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
    ],
  );
}

Widget rowTestSpaceAround() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 50.0),
    ],
  );
}

Widget rowTestText(BuildContext context) {
  return Container(
    color: Colors.amber,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          'Baseline',
          style: Theme.of(context).textTheme.display3,
        ),
        Text(
          'Baseline',
          style: Theme.of(context).textTheme.body1,
        ),
      ],
    ),
  );
}

Widget rowTestSizes() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      new Icon(Icons.star, size: 50.0),
      new Icon(Icons.star, size: 200.0),
      new Icon(Icons.star, size: 50.0),
    ],
  );
}

Widget botones() {
  return Center(
    child: IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text('Short'),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('A bit Longer'),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('The Longest text button'),
          ),
        ],
      ),
    ),
  );
}

Widget stacks() {
  return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Scaffold(
        appBar: AppBar(title: Text('Stack')),
      ),
      Banner(
        message: "RCC",
        location: BannerLocation.topStart,
      ),
      Banner(
        color: Colors.blueAccent,
        message: "Top End",
        location: BannerLocation.topEnd,
      ),
      Banner(
        message: "Bottom Start",
        color: Colors.blueGrey,
        location: BannerLocation.bottomStart,
      ),
      Banner(
        message: "Bottom End",
        color: Colors.deepOrangeAccent,
        location: BannerLocation.bottomEnd,
      ),
    ],
  );
}

Widget positioned() {
  return Scaffold(
    appBar: AppBar(
      title: Text('Stack'),
      backgroundColor: Colors.white12,
    ),
    body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Material(color: Colors.grey),
        Positioned(
          top: 0.0,
          left: 0.0,
          child: Icon(Icons.star, size: 50.0),
        ),
        Positioned(
          top: 340.0,
          left: 250.0,
          child: Icon(Icons.call, size: 50.0),
        ),
      ],
    ),
  );
}

Widget positioned2() {
  const iconSize = 50.0;
  return Scaffold(
    appBar: AppBar(title: Text('Stack with LayoutBuilder')),
    body: LayoutBuilder(
      builder: (context, constraints) => Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Material(color: Colors.yellowAccent),
              Positioned(
                top: 0.0,
                child: Icon(Icons.star, size: iconSize),
              ),
              Positioned(
                top: constraints.maxHeight - iconSize,
                left: constraints.maxWidth - iconSize,
                child: Icon(Icons.call, size: iconSize),
              ),
            ],
          ),
    ),
  );
}

Widget expanded1() {
  return Row(
    children: <Widget>[
      new Expanded(
        child: new Container(
          decoration: const BoxDecoration(color: Colors.red),
        ),
        flex: 3,
      ),
      new Expanded(
        child: new Container(
          decoration: const BoxDecoration(color: Colors.green),
        ),
        flex: 2,
      ),
      new Expanded(
        child: new Container(
          decoration: const BoxDecoration(color: Colors.blue),
        ),
        flex: 1,
      ),
    ],
  );
}

Widget consbox1() {
  return ConstrainedBox(
    constraints: BoxConstraints.expand(),
    child: Card(
      child: const Text("yaaay!"),
      color: Colors.lightGreen,
    ),
  );
}

Widget consbox2({opt: 1}) {
  return ConstrainedBox(
    constraints: new BoxConstraints.expand(height: 300.0),
    child: const Card(
      child: const Text('🔥🔥🔥🔥🔥🔥🔥!'),
      color: Colors.blueGrey,
    ),
  );
}

Widget container1() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: Colors.blueAccent,
    child: Text("Hi"),
  );
}

Widget container2() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(color: Colors.yellowAccent),
    foregroundDecoration: BoxDecoration(color: Colors.red.withOpacity(0.5)),
    child: Text("Hi"),
  );
}
