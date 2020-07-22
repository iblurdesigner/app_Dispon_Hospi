import 'package:flutter/material.dart';
import '../widgets/header_search.dart';
import '../widgets/pins.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    throw UnimplementedError();

    final title = Column (
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 40,
            left: 30,
            right: 30
          ),

          child: Text(
            "Hospitales COVID-19",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(32, 94, 141, 1)
            ),
          ),
        )
      ],
    );

    final description = Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 17.0,
            left: 97.0,
            right: 97.0
          ),

          child: Text(
            "Busca la disponibilidad de camas generales",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 17.0,
              fontWeight: FontWeight.w100,
              color: Color.fromRGBO(32, 94, 141, 1)
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );


    return Column(
      children: <Widget>[
        HeaderSearch(),
        title,
        description,
        Pins()
      ],
    );

  }

}