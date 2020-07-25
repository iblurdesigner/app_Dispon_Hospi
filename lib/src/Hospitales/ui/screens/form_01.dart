import 'package:flutter/material.dart';
import '../widgets/header_search.dart';
import 'form_02.dart';
import '../widgets/dropdownbutton.dart';


class Form01 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    final Question01 = Column (
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 40,
              left: 30,
              right: 30
          ),

          child: Text(
            "¿Tienes coloración (morada o azul) en dedos o boca?",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(32, 94, 141, 1)
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );



    final Question02 = Column (
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 40,
              left: 30,
              right: 30
          ),

          child: Text(
            "¿Tienes dificultad de respirar?",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(32, 94, 141, 1)
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );


    final buttonContinuar = Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => Form02()
          )
          );
        },

        child: Text(
          'CONTINUAR',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.w100,
              color: Colors.white
          ),
        ),

        color: Color.fromRGBO(74, 208, 173, 1),

        // para bordes redondeados del boton
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),

      ),

    );





    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: <Widget>[
          HeaderSearch(),
          Question01,
          DropDownButtonCovid(),
          Question02,
          DropDownButtonCovid(),
          buttonContinuar
        ],
      ),

    );
  }

}