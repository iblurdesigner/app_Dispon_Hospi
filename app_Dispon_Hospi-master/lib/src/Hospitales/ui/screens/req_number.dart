import 'package:flutter/material.dart';
import '../widgets/header_search.dart';
import 'message.dart';


class ReqNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    final Advertencia = Column (
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 40,
              left: 15,
              right: 15
          ),

          child: Text(
            "Es posible que necesites ser hospitalizado",
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



    final textReq = Column (
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 20,
              left: 30,
              right: 30
          ),

          child: Text(
            "Escribe tu teléfono para recibir una llamada para ser canalizado",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18.0,
                fontWeight: FontWeight.w200,
                color: Color.fromRGBO(32, 94, 141, 1)
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );

    final numCel = Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 30,
        right: 30,
        bottom: 20
      ),
      child: TextField(
        style: TextStyle(
            fontFamily: 'Monserrat',
            fontSize: 16,
            fontWeight: FontWeight.w300
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            prefixIcon: Icon(Icons.phone),
            hintText: 'Ejemplo: 0998887776'
        ),
      ),
    );

    final buttonContinuar3 = Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => Message()
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
          Advertencia,
          textReq,
          numCel,
          buttonContinuar3
        ],
      ),

    );
  }

}