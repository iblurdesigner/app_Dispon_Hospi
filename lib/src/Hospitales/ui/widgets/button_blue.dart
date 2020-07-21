import 'dart:html';

import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {

  String buttonText = "EVALUAR";
  final Function where;

  ButtonBlue(this.buttonText, this.where);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    return InkWell(

      child: Container(
        margin: EdgeInsets.only(
          top: 30,
          left: 20,
          right: 30,
        ),
        height: 190,
        width: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color.fromRGBO(74, 208, 173, 1)
        ),
        
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(
                builder: (context) => where()
            )
            );
          },
          child: Text(
            buttonText,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.w100,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

}