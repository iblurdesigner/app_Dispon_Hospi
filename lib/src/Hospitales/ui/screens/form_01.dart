import 'dart:core';
import 'package:flutter/material.dart';
import 'package:disponi_hospi/src/Hospitales/ui/widgets/dropdownbutton.dart';
import 'package:disponi_hospi/src/Hospitales/ui/widgets/header_search.dart';
import 'package:disponi_hospi/src/services/routes.dart';
import 'form_02.dart';

class Form01 extends StatelessWidget {

  final EvaluatedData evaluatedData;
  final EvaluationData evaluationData = EvaluationData();
  Form01({this.evaluatedData});

  @override
  Widget build(BuildContext context) {
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
        ),
      ],
    );

    final dropDownButtonCovid1 = DropDownButtonCovid();

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

    final dropDownButtonCovid2 = DropDownButtonCovid();

    final buttonContinuar = Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => storageEvaluationData(
                evaluatedData, 
                dropDownButtonCovid1.getDropDownButtonValue(),
                dropDownButtonCovid2.getDropDownButtonValue()
              )
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
          dropDownButtonCovid1,
          Question02,
          dropDownButtonCovid2,
          buttonContinuar
        ],
      ),
    );
  }

  storageEvaluationData(EvaluatedData evaluatedData, String fingers, String breathe) {
    evaluationData.setData(fingers, breathe, '', '', evaluatedData.idEvaluated);
    return Form02(evaluationData: evaluationData);
  }
}