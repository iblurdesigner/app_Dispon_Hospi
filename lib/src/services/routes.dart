import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Routes {

  static final String apiServer = 'http://10.0.2.2:3000';
  
  static Future<http.Response> postEvaluated (String city, String address, String age) async {
    var url = apiServer + '/api/evaluated/save';
    Map data = {'ciudad':city,'dirEvaluado':address,'edad':age};
    debugPrint(json.encode(data));
    var response = await http.post(url, headers: {"ContectType": "application/x-www-form-urlencoded"}, body: data);
    return response;
  }
}

class DataEvaluated {
  int idEvaluated;
  DataEvaluated({this.idEvaluated});
}