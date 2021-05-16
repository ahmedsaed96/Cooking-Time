import 'package:coocking_time/widgets/drawer.dart';
import 'package:flutter/material.dart';

class AllRecipes extends StatelessWidget {
  static const String routeName = 'AllRecipes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: CustumDrawer(),
      appBar: AppBar(
        title: Text('All Recipes'),
        centerTitle: true,
      ),
    );
  }
}
