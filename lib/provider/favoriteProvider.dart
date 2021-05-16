import 'package:coocking_time/model/meal.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  FavoriteProvider() {
    favoriteList;
  }
  String imageNetworkUrl;
  String title;
  String category;
  Meal myelement;
  Meal get element {
    notifyListeners();
    return myelement;
  }

  List<Meal> myFavoriteList = [];
  List<Meal> get favoriteList {
    notifyListeners();
    return myFavoriteList;
  }
}
