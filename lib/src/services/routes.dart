import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Routes {

  static final String apiServer = 'http://10.0.2.2:3000';
  
  static Future<http.Response> postEvaluated(String city, String address, String age) async {
    var url = apiServer + '/api/evaluated/save';
    Map data = {'ciudad':city,'dirEvaluado':address,'edad':age};
    debugPrint(json.encode(data));
    var response = await http.post(url, headers: {"ContectType": "application/x-www-form-urlencoded"}, body: data);
    return response;
  }

  static Future<http.Response> postUpdateEvaluated(EvaluatedData evaluatedData) async {
    var url = apiServer + '/api/evaluated/update';
    Map data = {'idEvaluado': evaluatedData.idEvaluated.toString(), 'telefono': evaluatedData.phone };
    debugPrint(json.encode(data));
    var response = await http.post(url, headers: {"ContectType": "application/x-www-form-urlencoded"}, body: data);
    return response;
  }

  static Future<http.Response> postEvaluation(EvaluationData evaluationData) async {
    var url = apiServer + '/api/evaluation/save';
    Map data = {
      'pColoracionDedos': evaluationData.fingers, 
      'pDificultadRespirar': evaluationData.breathe,
      'pfiebre': evaluationData.fever, 
      'pHipertenso': evaluationData.hypertensive,
      'idEvaluado': evaluationData.idEvaluated.toString(),
      'sumEvaluacion': evaluationData.sum.toString()
    };
    debugPrint(json.encode(data));
    var response = await http.post(url, headers: {"ContectType": "application/x-www-form-urlencoded"}, body: data);
    return response;
  }
}

class EvaluatedData {
  int idEvaluated;
  String phone;
  EvaluatedData({this.idEvaluated, this.phone});
}

class EvaluationData {
  String fingers;
  String breathe;
  String fever;
  String hypertensive;
  int idEvaluated;
  int sum = 0;
  int idEvaluation;
  EvaluationData({this.fingers, this.breathe, this.fever, this.hypertensive, this.idEvaluated});
  
  setData(String fingers, String breathe, String fever, String hypertensive, int idEvaluated) {
    this.fingers = fingers;
    this.breathe = breathe;
    this.fever = fever;
    this.hypertensive = hypertensive;
    this.idEvaluated = idEvaluated;

    sum = 0;
    if (this.fingers=='Sí')
      this.sum++;
    if (this.breathe=='Sí')
      this.sum++;
    if (this.fever=='Sí')
      this.sum++;
    if (this.hypertensive=='Sí')
      this.sum++;
  }

  setIdEvaluation(int idEvaluation) {
    this.idEvaluation = idEvaluation;
  }
}