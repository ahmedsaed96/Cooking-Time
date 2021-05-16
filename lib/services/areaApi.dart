import 'dart:convert';
import 'package:coocking_time/model/area.dart';
import 'package:coocking_time/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AreaApi with ChangeNotifier {
  AreaApi() {
    loadAllArea();
  }
  List<AreaModel> allArea = [];
  List<Meal> allAreas = []; //this list contains all meals filterd by area.
  
  String areaUrl = 'https://www.themealdb.com/api/json/v1/1/list.php?a=list';
  convertListOfAreatoItem(List<dynamic> list) {
    List<AreaModel> allArea = [];
    allArea = list.map((e) => AreaModel.fromJson(e)).toList();
    return allArea;
  }

//this function work good
//محتاج اعرف هستدعيها فين
  Future loadAllArea() async {
    http.Response response = await http.get(areaUrl);
    if (response.statusCode == 200) {
      var item = json.decode(response.body);
      allArea = convertListOfAreatoItem(item['meals']);
    }
    notifyListeners();
  }
}
