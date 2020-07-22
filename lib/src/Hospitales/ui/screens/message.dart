import 'package:flutter/material.dart';
import '../widgets/header_search.dart';


class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    final MessageFinal = Column (
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 40,
              left: 30,
              right: 30
          ),

          child: Text(
            "Personal médico te contactará en breve para ser canalizado!",
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




    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: <Widget>[
          HeaderSearch(),
          MessageFinal,
        ],
      ),

    );
  }

}