import 'package:flutter/material.dart';
import '../widgets/header_search.dart';
import 'package:disponi_hospi/src/Hospitales/ui/screens/req_number.dart';

import '../widgets/dropdownbutton.dart';


class Form02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    final Question03 = Column (
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 40,
              left: 30,
              right: 30
          ),

          child: Text(
            "¿Has tenido fiebre (temperatura igual o mayor a 38 °C) y/o dolor de garganta por más de dos días?",
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



    final Question04 = Column (
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 40,
              left: 30,
              right: 30
          ),

          child: Text(
            "¿Eres hipertenso, diabético, EPOC, Mayor a 60 años?",
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


    final buttonContinuar2 = Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => ReqNumber()
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
          Question03,
          DropDownButtonCovid(),
          Question04,
          DropDownButtonCovid(),
          buttonContinuar2
        ],
      ),

    );
  }

}