import 'package:flutter/material.dart';

class Pins extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    final green = Container(
      margin: EdgeInsets.only(
        top: 32.0,
        left: 15.0,
        right: 15.0,
      ),

      width: 35.0,
      height: 44.0,

      child: Image.asset(
          "assets/img/pin_green@2x.png"
      ),

    );

    final text_green = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        right: 20.0
      ),

      child: Text(
        "Alta",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(60, 180, 0, 1)
        ),
      ),
    );


    final orange = Container(
      margin: EdgeInsets.only(
        top: 32.0,
        left: 15.0,
        right: 15.0,
      ),

      width: 35.0,
      height: 44.0,

      child: Image.asset(
          "assets/img/pin_orange@2x.png"
      ),

    );

    final text_orange = Container(
      margin: EdgeInsets.only(
          top: 20.0,
          right: 20.0
      ),

      child: Text(
        "Media",
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(247, 167, 16, 1)
        ),
      ),
    );


    final red = Container(
      margin: EdgeInsets.only(
        top: 32.0,
        left: 15.0,
        right: 15.0,
      ),

      width: 35.0,
      height: 44.0,

      child: Image.asset(
          "assets/img/pin_red@2x.png"
      ),

    );

    final text_red = Container(
      margin: EdgeInsets.only(
          top: 20.0,
          right: 20.0
      ),

      child: Text(
        "Escasa",
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(223, 33, 32, 1)
        ),
      ),
    );

    final pins = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        green,
        text_green,
        orange,
        text_orange,
        red,
        text_red
      ],
    );

    return Column(
      children: <Widget>[
        pins
      ],
    );

  }

}