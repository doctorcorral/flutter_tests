import 'package:flutter/material.dart';
import 'package:medium_clap_flutter/medium_clap_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(AppVergas());

class AppVergas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "medium clap",
      home: ClapWidgetImg(),
    );
  }
}

class ClapWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      //Use this child anywhere in your app
      child: ClapFAB.icon(
        defaultIcon: FontAwesomeIcons.heart,
        filledIcon: FontAwesomeIcons.solidHeart,
        countCircleColor: Colors.green,
        defaultIconColor: Colors.green,
        hasShadow: true,
        sparkleColor: Colors.green,
        shadowColor: Colors.green,
        filledIconColor: Colors.green,
      ),
    );
  }
}

class ClapWidgetImg extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      //Use this child anywhere in your app
      child: ClapFAB.image(
        defaultImage: "images/clap.png",
        filledImage: "images/clap.png",
        countCircleColor: Colors.red,
        hasShadow: true,
        sparkleColor: Colors.red,
        shadowColor: Colors.red,
        defaultImageColor: Colors.red,
        filledImageColor: Colors.red,
      ),
    );
  }
}
