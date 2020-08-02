import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:disponi_hospi/src/Hospitales/ui/widgets/dropdownbutton.dart';
import 'package:disponi_hospi/src/Hospitales/ui/widgets/header_search.dart';
import 'package:disponi_hospi/src/Hospitales/ui/screens/req_number.dart';
import 'package:disponi_hospi/src/services/routes.dart';
import 'message.dart';

class Form02 extends StatelessWidget {

  final EvaluationData evaluationData;
  Form02({this.evaluationData});

  @override
  Widget build(BuildContext context) {
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
        ),
      ],
    );

    final dropDownButtonCovid3 = DropDownButtonCovid();

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

    final dropDownButtonCovid4 = DropDownButtonCovid();

    final buttonContinuar2 = Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => storageEvaluationData(
                evaluationData,
                dropDownButtonCovid3.getDropDownButtonValue(),
                dropDownButtonCovid4.getDropDownButtonValue())
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
          dropDownButtonCovid3,
          Question04,
          dropDownButtonCovid4,
          buttonContinuar2
        ],
      ),
    );
  }

  storageEvaluationData(EvaluationData evaluationData, String fever, String hypertensive) {
    evaluationData.setData(evaluationData.fingers, evaluationData.breathe, fever, hypertensive, evaluationData.idEvaluated);
    return sendEvaluation(evaluationData);
  }

  sendEvaluation(evaluationData) {
    return FutureBuilder<http.Response>(
      future: Routes.postEvaluation(evaluationData),
      builder: (context, AsyncSnapshot<http.Response> response) {
        if (response.hasData && response.data.statusCode==200) {
          var data = jsonDecode(response.data.body);
          debugPrint(data.toString());
          evaluationData.setIdEvaluation(data['idPregunta']);
          if (evaluationData.sum > 0)
            return ReqNumber(evaluationData: evaluationData);
          else
            return Message();
        } else if (response.hasError) {
          return Text("${response.error}");
        } else {
          return CircularProgressIndicator();
        }
      }
    );
  }
}