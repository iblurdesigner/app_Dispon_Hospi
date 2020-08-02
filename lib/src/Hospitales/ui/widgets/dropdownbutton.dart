import 'package:flutter/material.dart';

class DropDownButtonCovid extends StatefulWidget{

  _DropDownButtonCovid dropDownButtonCovid;

  @override
  State<StatefulWidget> createState() {
    //throw UnimplementedError();
    dropDownButtonCovid = _DropDownButtonCovid();
    return dropDownButtonCovid;
  }

  String getDropDownButtonValue() {
    return dropDownButtonCovid.dropdownValue;
  }
}

class _DropDownButtonCovid extends State<DropDownButtonCovid> {

  String dropdownValue = 'No';

  @override
  Widget build(BuildContext context) {
    //throw UnimplementedError();

    return DropdownButton<String> (
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
          setState(() {
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