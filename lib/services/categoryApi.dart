import 'dart:convert';

import 'package:coocking_time/model/category.dart';
import 'package:coocking_time/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryApi with ChangeNotifier {

   CategoryApi() {
    loadCategories();
  }
  
  String imageUrlProvider = '';
  List<String> myCountryFlags = [
    'https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg',
    'https://www.crushpixel.com/big-static11/preview4/uk-british-flag-union-jack-720005.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/d/d9/Flag_of_Canada_%28Pantone%29.svg',
    'https://upload.wikimedia.org/wikipedia/commons/f/fa/Flag_of_the_People%27s_Republic_of_China.svg',
    'https://upload.wikimedia.org/wikipedia/commons/2/20/Flag_of_the_Netherlands.svg',
    'https://upload.wikimedia.org/wikipedia/commons/f/fe/Flag_of_Egypt.svg',
    'https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg',
    'https://www.greeka.com/photos/unique/greece/greece-history/flags/hero/greece-history-flags-1-1280.webp',
    'https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg'
        'https://upload.wikimedia.org/wikipedia/commons/4/45/Flag_of_Ireland.svg',
    'https://upload.wikimedia.org/wikipedia/en/0/03/Flag_of_Italy.svg',
    'https://upload.wikimedia.org/wikipedia/commons/0/0a/Flag_of_Jamaica.svg',
    'https://upload.wikimedia.org/wikipedia/commons/9/9e/Flag_of_Japan.svg',
    'https://upload.wikimedia.org/wikipedia/commons/4/49/Flag_of_Kenya.svg',
    'https://upload.wikimedia.org/wikipedia/commons/6/66/Flag_of_Malaysia.svg',
    'https://upload.wikimedia.org/wikipedia/commons/6/62/Mexican_flag.png',
    'https://upload.wikimedia.org/wikipedia/commons/2/2c/Flag_of_Morocco.svg',
    'https://upload.wikimedia.org/wikipedia/en/1/12/Flag_of_Poland.svg',
    'https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_Portugal.svg',
    'https://upload.wikimedia.org/wikipedia/en/f/f3/Flag_of_Russia.svg',
    'https://upload.wikimedia.org/wikipedia/commons/8/89/Bandera_de_Espa%C3%B1a.svg',
    'https://upload.wikimedia.org/wikipedia/commons/a/a9/Flag_of_Thailand.svg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Flag_of_Tunisia.svg/1024px-Flag_of_Tunisia.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/1024px-Flag_of_Turkey.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/2/2f/Missing_flag.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/1024px-Flag_of_Vietnam.svg.png'
  ];
  List<String> get categoryFlag {
    notifyListeners();
    return myCountryFlags;
  }

  List<Category> categoryList = [];
  List<Meal> myListOfCategoryItems = [];
  List<Meal> get listOfCategoryItems {
    notifyListeners();
    return myListOfCategoryItems;
  }

  String firstItemInDropDown = 'Category';
  List listDropDown = <String>['Category', 'Area']
      .map<DropdownMenuItem<String>>((String value) {
    // print('your value fro DDM is $value');
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
  changeDropDownMenu(String value) {
    firstItemInDropDown = value;
    notifyListeners();
  }

 
  String categoriesUrl =
      'https://www.themealdb.com/api/json/v1/1/categories.php';

  convertToLIstOfCategory(List<dynamic> list) {
    List<Category> categoryList = [];
    categoryList = list.map((e) => Category.fromJson(e)).toList();
    return categoryList;
  }

  Future loadCategories() async {
    http.Response response = await http.get(categoriesUrl);
    if (response.statusCode == 200) {
      var singleCategory = json.decode(response.body);
      categoryList = convertToLIstOfCategory(singleCategory['categories']);
    }
    notifyListeners();
  }
}
