import 'package:coocking_time/model/meal.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  @deprecated
  String imageNetworkUrl;
  @deprecated
  String title;
  @deprecated
  String category;
  @deprecated
  Meal myelement;

  @deprecated
  Meal get element {
    notifyListeners();
    return myelement;
  }

  List<Meal> _myFavoriteList = [];

  void addToFavorite(Meal meal) {
    _myFavoriteList.add(meal);
    notifyListeners();
  }

  void deleteFromFavorite(Meal meal) {
    _myFavoriteList.remove(meal);
    notifyListeners();
  }

  bool isExist(Meal meal) {
    return _myFavoriteList.contains(meal);
  }

  List<Meal> get favoriteList {
    return _myFavoriteList;
  }
}
