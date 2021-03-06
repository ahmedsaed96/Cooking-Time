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
  // String get imageUrlProvider {
  //   notifyListeners();
  //   return myImageUrlProvider;
  // }
  String areaFlag = '';
  List<String> categoryFlag = [
    'https://cdn.britannica.com/33/4833-004-828A9A84/Flag-United-States-of-America.jpg',
    'https://cdn.britannica.com/25/4825-004-F1975B92/Flag-United-Kingdom.jpg',
    'https://cdn.britannica.com/68/7068-004-7848FEB4/Flag-Canada.jpg',
    'https://cdn.britannica.com/90/7490-004-BAD4AA72/Flag-China.jpg',
    'https://cdn.britannica.com/82/2982-004-84A2A71E/flag-prototype-Netherlands-countries-European-flags.jpg',
    'https://cdn.britannica.com/85/185-050-6A8E2E8A/Flag-Egypt.jpg',
    'https://cdn.britannica.com/82/682-050-8AA3D6A6/Flag-France.jpg',
    'https://cdn.britannica.com/49/1049-050-3AD6578E/Flag-Greece.jpg',
    'https://cdn.britannica.com/97/1597-050-008F30FA/Flag-India.jpg',
    'https://cdn.britannica.com/33/1733-050-04264811/FLAG-Ireland.jpg',
    'https://cdn.britannica.com/59/1759-050-FCD5A574/Flag-Italy.jpg',
    'https://cdn.britannica.com/20/5120-004-3E9D869E/Flag-Jamaica.jpg',
    'https://cdn.britannica.com/91/1791-004-DA3579A5/Flag-Japan.jpg',
    'https://cdn.britannica.com/15/15-004-B5D6BF80/Flag-Kenya.jpg',
    'https://cdn.britannica.com/31/4031-004-82B0F3A9/Flag-Malaysia.jpg',
    'https://cdn.britannica.com/73/2573-004-29818847/Flag-Mexico.jpg',
    'https://cdn.britannica.com/39/3039-004-52B064C7/Flag-Morocco.jpg',
    'https://cdn.britannica.com/52/3552-004-83ABA964/Flag-Poland.jpg',
    'https://cdn.britannica.com/88/3588-004-E0E45339/Flag-Portugal.jpg',
    'https://cdn.britannica.com/42/3842-004-F47B77BC/Flag-Russia.jpg',
    'https://cdn.britannica.com/36/4336-004-6BD81071/Flag-Spain.jpg',
    'https://cdn.britannica.com/38/4038-004-111388C2/Flag-Thailand.jpg',
    'https://cdn.britannica.com/41/3041-004-F1D6DEFC/Flag-Tunisia.jpg',
    'https://cdn.britannica.com/82/4782-004-4119489D/Flag-Turkey.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/2/2f/Missing_flag.png',
    'https://cdn.britannica.com/41/4041-004-D051B135/Flag-Vietnam.jpg',
  ];
  // List<String> get categoryFlag {
  //   notifyListeners();
  //   return myCountryFlags;
  // }

  List<Category> categoryList = [];
  List<Meal> listOfCategoryItems = [];
  // List<Meal> get listOfCategoryItems {
  //   notifyListeners();
  //   return myListOfCategoryItems;
  // }

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
