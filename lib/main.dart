import 'package:coocking_time/provider/favoriteProvider.dart';
import 'package:coocking_time/screens/allRecipes.dart';
import 'package:coocking_time/screens/categoryListScreen.dart';
import 'package:coocking_time/screens/categoryMealsDetails.dart';
import 'package:coocking_time/screens/detailsScreen.dart';
import 'package:coocking_time/screens/favoriteListDetails.dart';
import 'package:coocking_time/screens/favoriteScreen.dart';
import 'package:coocking_time/screens/homePage.dart';
import 'package:coocking_time/screens/settingScreen.dart';
import 'package:coocking_time/services/areaApi.dart';
import 'package:coocking_time/services/categoryApi.dart';
import 'package:coocking_time/services/mainApi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Api(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CategoryApi(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AreaApi(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => FavoriteProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            canvasColor: Colors.white,
            brightness: Brightness.light,
            primaryColor: Colors.orange[400]),
        title: 'Material App',
        // home: CategoryListScreen(),
        home: HomePage(),
        routes: {
          DetailsScreen.routeName: (context) => DetailsScreen(),
          AllRecipes.routeName: (context) => AllRecipes(),
          CategoryListScreen.routeName: (context) => CategoryListScreen(),
          CategoryMeals.routeName: (context) => CategoryMeals(),
          HomePage.routeName: (context) => HomePage(),
          FavoriteScreen.routeName: (context) => FavoriteScreen(),
          FavoriteLIstDetailsScreen.routeName: (context) =>
              FavoriteLIstDetailsScreen(),
          SettingScreen.routeName: (context) => SettingScreen(),
        },
      ),
    );
  }
}
