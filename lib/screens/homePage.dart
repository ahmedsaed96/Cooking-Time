import 'package:coocking_time/constant.dart';
import 'package:coocking_time/provider/favoriteProvider.dart';
import 'package:coocking_time/model/meal.dart';
import 'package:coocking_time/screens/detailsScreen.dart';
import 'package:coocking_time/services/mainApi.dart';
import 'package:coocking_time/function.dart';
import 'package:coocking_time/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'HomePage';
//TODO:ineed solve this problem for performance
//and internet slow and solve console errors
  // final Api api = Api();
  //// i comment this line because random meals list items dont show i try to use consumer again
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustumDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'cock app',
          style: kStyle1,
        ),
        centerTitle: true,
      ),
      body: Consumer<Api>(
        builder: (context, api, child) => ListView(
          padding: EdgeInsets.all(15.0),
          children: [
            Text(
              'What would you like to cook?',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 33.0),
            ),
            SizedBox(height: 10.0),
            Text('Today recipe', style: kStyle1),
            SizedBox(height: 10.0),
            //////////////// //First LIst
            Container(
              width: size.width / 2.1,
              height: size.height / 3.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return todayRecipeCard(
                      size: size,
                      imageUrl: api.randomMeals[index].strMealThumb,
                      nameofrecipe: api.randomMeals[index].strMeal,
                      onTap: () => Navigator.of(context)
                              .pushNamed(DetailsScreen.routeName, arguments: {
                            'thumb': api.randomMeals[index].strMealThumb,
                            'index': index,
                            'num': 0,
                          }));
                },
                itemCount: api.randomMeals.length,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Special recipes',
                  style: kStyle1,
                ),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ///////////////// //Second List
            Container(
              height: size.height / 3.7,
              width: size.width,
              //i will delete this fture in the end of app
              // child: FutureBuilder(
              // future: api.loadMeals(),
              // builder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return Center(child: CircularProgressIndicator());
              // } else if (snapshot.connectionState == ConnectionState.none) {
              //   return Center(
              //     child: Text('No Data'),
              //   );
              // }
              // if (snapshot.connectionState == ConnectionState.done)
              child: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(DetailsScreen.routeName, arguments: {
                      'thumb': api.meals[index].strMealThumb,
                      'index': index,
                      'num': 1,
                    });
                  },
                  child: spicialRecipesRow(
                      country: api.meals[index].strArea,
                      male: api.meals[index],
                      recipeName: api.meals[index].strMeal,
                      size: size,
                      category: api.meals[index].strCategory,
                      imageUrl: api.meals[index].strMealThumb),
                ),
                itemCount: api.meals.length,
              ),
              // return null;
              // },
              // ),
            ),
          ],
        ),
      ),
    );
  }

//////////////////functions

  Widget spicialRecipesRow(
      {Size size,
      String imageUrl,
      // Function onTab,
      String recipeName,
      String category = 'category',
      String country,
      Meal male}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10.0, right: 10.0),
            margin: EdgeInsets.only(right: 10),
            width: size.width / 3.2,
            height: size.height / 4.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.8 - 82,
                child: Text(recipeName,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10.0),
              Text(category, style: kStyleSmall),
              SizedBox(height: 10.0),
              Text(country, style: kStyleSmall),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 10.0, width: size.width / 2.4),
                  //TODO:Ihave unknowen problem here
                  Consumer<FavoriteProvider>(
                    builder: (context, provider, child) => Container(
                      child: IconButton(
                          //ineed consumer here to update ui when tap
                          icon: !provider.favoriteList.contains(male)
                              ? Icon(Icons.favorite_border_sharp)
                              : Icon(Icons.favorite),
                          color: !provider.favoriteList.contains(male)
                              ? Colors.grey
                              : Colors.red,
                          onPressed: () {
                            !provider.favoriteList.contains(male)
                                ? provider.favoriteList.add(male)
                                : provider.favoriteList.remove(male);
                          }),
                    ),
                  ),
                  SizedBox(height: 10.0)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
