import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import '../widgets/header_search.dart';
import 'form_01.dart';
import '../../../services/routes.dart';


class Form00 extends StatelessWidget {

  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                children: <Widget>[
                  HeaderSearch(),
                  /*Container(
                    margin: EdgeInsets.only(
                        top: 5,
                        left: 30,
                        right: 30
                    ),
                    child: Text(
                      "Ciudad:",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(32, 94, 141, 1)
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),*/
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30
                    ),
                    child: TextField(
                      controller: cityController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese su ciudad',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30
                    ),
                    child: TextField(
                      controller: addressController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese su dirección',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30
                    ),
                    child: TextField(
                      obscureText: false,
                      controller: ageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Ingrese su edad"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30
                    ),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => sendEvaluated(cityController.text, addressController.text, ageController.text)
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
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ],
              ),
            )
          );
        },
      ),
    );
  }

  /// Send evaluated data to persistence module.
  sendEvaluated(String city, String address, String age) {
    return FutureBuilder<http.Response>(
      future: Routes.postEvaluated(city, address, age),
      builder: (context, AsyncSnapshot<http.Response> response) {
        if (response.hasData && response.data.statusCode==200) {
          var data = jsonDecode(response.data.body);
          debugPrint(data.toString());
          final dataEvaluated = DataEvaluated(idEvaluated: data['idEvaluado']);
          return Form01(dataEvaluated: dataEvaluated);
        } else if (response.hasError) {
          return Text("${response.error}");
        } else {
          return CircularProgressIndicator();
        }
      }
    );
  }
}

