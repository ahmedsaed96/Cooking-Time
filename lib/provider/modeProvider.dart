import 'package:flutter/material.dart';

class ModeProvuder with ChangeNotifier {
  List<String> modes = [
    //this list not used yet
    'Light Mode',
    'Dark Mode',
  ];
  //for test gitter is true or not
  bool lightMOdeValue = false;
  bool get mylightMOdeValue {
    notifyListeners();
    return lightMOdeValue;
  }

  bool darkMOdeValue = false;
}
