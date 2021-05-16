import 'package:coocking_time/model/meal.dart';
import 'package:coocking_time/provider/favoriteProvider.dart';
import 'package:coocking_time/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class FavoriteLIstDetailsScreen extends StatelessWidget {
  static const String routeName = 'FavoriteLIstDetailsScreen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments;
    var indexOfArguments = arguments['index'];
    var element = arguments['element'];
    return Scaffold(
      appBar: AppBar(), //buildAppBarWithFavoriteIcon(context, element),
      drawer: CustumDrawer(),
      body: Consumer<FavoriteProvider>(
        builder: (context, p, _) => Stack(
          children: [
            Image.network(
              //TODO:1
              'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width,
                height: size.height / 1.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: Container(
                  width: size.width,
                  height: size.height / 1.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(10.0)),
                            width: 40.0,
                            height: 4.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 50.0,
                            width: size.width - 10,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      ' category: ${p.favoriteList[indexOfArguments].strCategory}'),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                    child: Text(
                                        'area: ${p.favoriteList[indexOfArguments].strArea}'))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${p.favoriteList[indexOfArguments].strMeal}',
                                style: kStyle1,
                              ),
                              SizedBox(height: 30.0),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient1,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure1),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient2,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure2),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient3,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure3),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient4,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure4),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient5,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure5),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient6,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure6),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient7,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure7),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient8,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure8),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient9,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure9),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient10,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure10),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient11,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure11),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient12,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure12),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient13,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure13),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient14,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure14),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient15,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure15),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient16,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure16),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient17,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure17),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient18,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure18),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient19,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure19),
                              buildRowOfIngredients(
                                  context: context,
                                  ingredients: p.favoriteList[indexOfArguments]
                                      .strIngredient20,
                                  quantity: p.favoriteList[indexOfArguments]
                                      .strMeasure20),
                              SizedBox(height: 30.0),
                              Text(
                                'Instructions: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                '${p.favoriteList[indexOfArguments].strInstructions}',
                                style: kStyleSmall,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildRowOfIngredients(
      {BuildContext context, String ingredients, String quantity}) {
    return ingredients.isNotEmpty
        ? Row(
            children: [
              Container(
                width: 10.0,
                height: 10.0,
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
              ),
              SizedBox(width: 15.0),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  children: [
                    Text(
                      ingredients,
                      style: kStyleSmall,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                        child: Text(
                      quantity,
                      style: kStyleSmall,
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          )
        : Container();
  }
}
