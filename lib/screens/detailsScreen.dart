import 'package:coocking_time/constant.dart';
import 'package:coocking_time/provider/favoriteProvider.dart';
import 'package:coocking_time/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:coocking_time/services/mainApi.dart';
import 'package:provider/provider.dart';

import '../function.dart';

//TODO: ui need some work here
//readius and text
class DetailsScreen extends StatelessWidget {
  static const String routeName = 'DetailsScreen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<dynamic, dynamic> argument = ModalRoute.of(context).settings.arguments;
    var arguments = argument['thumb'];
    var myIndex = argument['index'];
    var myIndex0 = argument['index'];
    var myNum = argument['num'];
//1=meals
//2=randommeals
    // print(myIndex0);
    return Scaffold(
      drawer: CustumDrawer(),
      /* myNum == 1
                                    ? api.meals[myIndex].strMeal
                                    : api.randomMeals[myIndex0].strMeal, */
      appBar: buildAppBarWithFavoriteIcon(
          context,
          myNum == 1
              ? Provider.of<Api>(context).meals[myIndex]
              : Provider.of<Api>(context).randomMeals[myIndex0]),
      body: Stack(
        children: [
          Image.network(
            arguments.toString(),
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
                //
                width: size.width,
                height: size.height / 1.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: SingleChildScrollView(
                  child: Consumer<Api>(
                    builder: (ctx, api, widget) => Column(
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
                                    myNum == 1
                                        ? 'Category: ${api.meals[myIndex].strCategory}'
                                        : 'Category: ${api.randomMeals[myIndex0].strCategory}',
                                    style: kStyleSmall,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: Text(
                                    myNum == 1
                                        ? 'Area: ${api.meals[myIndex].strArea}'
                                        : 'Area: ${api.randomMeals[myIndex0].strArea}',
                                    style: kStyleSmall,
                                  ),
                                ),
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
                                myNum == 1
                                    ? api.meals[myIndex].strMeal
                                    : api.randomMeals[myIndex0].strMeal,
                                style: kStyle1,
                              ),
                              SizedBox(height: 30.0),
                              Text(
                                'ingredients: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(height: 10.0),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient1
                                      : api
                                          .randomMeals[myIndex0].strIngredient1,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure1
                                      : api.randomMeals[myIndex0].strMeasure1),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient2
                                      : api
                                          .randomMeals[myIndex0].strIngredient2,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure2
                                      : api.randomMeals[myIndex0].strMeasure2),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient3
                                      : api
                                          .randomMeals[myIndex0].strIngredient3,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure3
                                      : api.randomMeals[myIndex0].strMeasure3),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient4
                                      : api
                                          .randomMeals[myIndex0].strIngredient4,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure4
                                      : api.randomMeals[myIndex0].strMeasure4),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient5
                                      : api
                                          .randomMeals[myIndex0].strIngredient5,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure5
                                      : api.meals[myIndex].strMeasure5),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient6
                                      : api
                                          .randomMeals[myIndex0].strIngredient6,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure6
                                      : api.randomMeals[myIndex0].strMeasure6),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient7
                                      : api
                                          .randomMeals[myIndex0].strIngredient7,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure7
                                      : api.randomMeals[myIndex0].strMeasure7),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient8
                                      : api
                                          .randomMeals[myIndex0].strIngredient8,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure8
                                      : api.randomMeals[myIndex0].strMeasure8),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient9
                                      : api
                                          .randomMeals[myIndex0].strIngredient9,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure9
                                      : api.randomMeals[myIndex0].strMeasure9),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient10
                                      : api.randomMeals[myIndex0]
                                          .strIngredient10,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure10
                                      : api.randomMeals[myIndex0].strMeasure10),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient11
                                      : api.randomMeals[myIndex0]
                                          .strIngredient11,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure11
                                      : api.randomMeals[myIndex0].strMeasure11),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient12
                                      : api.randomMeals[myIndex0]
                                          .strIngredient12,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure12
                                      : api.randomMeals[myIndex0].strMeasure12),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient13
                                      : api.randomMeals[myIndex0]
                                          .strIngredient13,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure13
                                      : api.randomMeals[myIndex0].strMeasure13),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient14
                                      : api.randomMeals[myIndex0]
                                          .strIngredient14,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure14
                                      : api.randomMeals[myIndex0].strMeasure14),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient15
                                      : api.randomMeals[myIndex0]
                                          .strIngredient15,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure15
                                      : api.randomMeals[myIndex0].strMeasure15),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient16
                                      : api.randomMeals[myIndex0]
                                          .strIngredient16,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure16
                                      : api.randomMeals[myIndex0].strMeasure16),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient17
                                      : api.randomMeals[myIndex0]
                                          .strIngredient17,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure17
                                      : api.randomMeals[myIndex0].strMeasure17),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient18
                                      : api.randomMeals[myIndex0]
                                          .strIngredient18,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure18
                                      : api.randomMeals[myIndex0].strMeasure18),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient19
                                      : api.randomMeals[myIndex0]
                                          .strIngredient19,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure19
                                      : api.randomMeals[myIndex0].strMeasure19),
                              buildIngredientsItem(
                                  size,
                                  context,
                                  myIndex,
                                  myNum == 1
                                      ? api.meals[myIndex].strIngredient20
                                      : api.randomMeals[myIndex0]
                                          .strIngredient20,
                                  myNum == 1
                                      ? api.meals[myIndex].strMeasure20
                                      : api.randomMeals[myIndex0].strMeasure20),
                              SizedBox(height: 30.0),
                              Text(
                                'Instructions: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                api.meals[myIndex].strInstructions,
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
          )
        ],
      ),
    );
  }

  Container buildIngredientsItem(Size size, BuildContext context, int myIndex,
      String ingredientItem, String quantity) {
    return Container(
      // height: 180,
      width: size.width - 10,
      child: ingredientItem.isNotEmpty
          ? rowingredients(context, ingredientItem, quantity)
          : Container(),
    );
  }

  Row rowingredients(BuildContext context, String text, String quantity) {
    return Row(
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
          child: text.isNotEmpty
              ? Row(
                  children: [
                    Text(
                      text,
                      style: kStyleSmall,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        quantity,
                        style: kStyleSmall,
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }


}
