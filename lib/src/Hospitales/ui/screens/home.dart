import 'package:flutter/material.dart';
import '../widgets/header_search.dart';
import 'form_00.dart';
import 'search.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    final Section01 = Column (
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 15,
              left: 30,
              right: 30
          ),

          child: Text(
            "Tengo síntomas asociados a COVID, y quiero saber si debo ser hospitalizado",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(32, 94, 141, 1)
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );

    final buttonForm = Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => Form00()
          )
          );
        },

        child: Text(
          'EVALUAR',
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


    final Section02 = Column (
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 15,
              left: 30,
              right: 30
          ),

          child: Text(
            "Quiero ver el mapa de hospitales",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(32, 94, 141, 1)
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );


    final buttonSearch = Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => Search()
          )
          );
        },

        child: Text(
          'CONSULTAR',
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
          Section01,
          buttonForm,
          Section02,
          buttonSearch
        ],
      ),

    );
  }

}