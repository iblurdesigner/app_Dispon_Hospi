import 'package:flutter/material.dart';

class DropDownButtonCovid extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();

    return _DropDownButtonCovid();
  }

}

class _DropDownButtonCovid extends State<DropDownButtonCovid> {
  String dropdownValue = 'Sí';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    return           DropdownButton<String> (
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 26,
        style: TextStyle(
            color: Colors.deepPurple
        ),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState( () {
            dropdownValue = newValue;
          });
        },
        items: <String>['Sí', 'No']
            .map<DropdownMenuItem<String>> ((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        })
            .toList()
    );
  }

}