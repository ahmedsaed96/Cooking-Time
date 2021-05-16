import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:coocking_time/model/meal.dart';

class Api with ChangeNotifier {
  Api() {
    loadMeals();
    loadRandomMeals();
  }
  List<Meal> meals = [];
  List<Meal> listOfCategorItems(String category) {
    List<Meal> myList = [];

    for (var item in meals) {
      if (item.strCategory == category) {
        myList.add(item);
      }
    }
    notifyListeners();
    return myList;
  }

  List<Meal> listOfAreaItems(String area) {
    List<Meal> myList = [];

    for (var item in meals) {
      if (item.strArea == area) {
        myList.add(item);
      }
    }
    notifyListeners();
    return myList;
  }

  List<Meal> randomMeals = [];
  changelist(myNum, api) {
    var a = api.meals;
    if (myNum == 0) {
      a = api.randomMeals;
    }
    a = api.meals;
    notifyListeners();
    return a;
  }

  //ishould change f= to any charachter by loop;
  String url = 'https://www.themealdb.com/api/json/v1/1/search.php?f=b';
  String randomMealUrl = 'https://www.themealdb.com/api/json/v1/1/random.php';
  List<Meal> toListOfMeal(List<dynamic> myList) {
    List<Meal> mealsList = [];
    mealsList = myList.map((e) => Meal.fromJson(e)).toList();
    return mealsList;
  }

//main funvtion
  Future loadMeals() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var meal = json.decode(response.body);
      meals = toListOfMeal(meal['meals']);
    }
    notifyListeners();
  }

  loadRandomMeals() {
    for (var i = 0; i < 15; i++) {
      loadRandomMeal();
    }
  }

  Future loadRandomMeal() async {
    http.Response response = await http.get(randomMealUrl);
    if (response.statusCode == 200) {
      var meal = json.decode(response.body);
      var a = toListOfMeal(meal['meals']);
      if (!randomMeals.contains(a)) {
        randomMeals += a;
      }
    }
    notifyListeners();
  }
}
