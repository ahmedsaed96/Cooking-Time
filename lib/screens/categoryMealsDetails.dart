import 'package:coocking_time/model/meal.dart';
import 'package:coocking_time/provider/favoriteProvider.dart';
import 'package:coocking_time/services/areaApi.dart';
import 'package:coocking_time/services/categoryApi.dart';
import 'package:coocking_time/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryMeals extends StatelessWidget {
  static const String routeName = 'CategoryMeals';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: CustumDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Consumer2<CategoryApi, AreaApi>(
        builder: (ctx, categoryApi, areaApi, widget) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              categoryApi.firstItemInDropDown == 'Category'
                  ? categoryApi.imageUrlProvider
                  : categoryApi.areaFlag,
              fit: BoxFit.cover,
            ),
            Container(
                width: size.width,
                height: size.height / 1.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    //TODO:add on pressed here
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          height: size.height / 5,
                          width: size.width / 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                categoryApi.firstItemInDropDown == 'Category'
                                    ? categoryApi
                                        .listOfCategoryItems[index].strMealThumb
                                    : areaApi.allAreas[index].strMealThumb,
                              )),
                              borderRadius: BorderRadius.circular(65.0)),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              height: size.height / 6 - 50,
                              width: size.width / 2 - 10,
                              child: Text(
                                categoryApi.firstItemInDropDown == 'Category'
                                    ? categoryApi
                                        .listOfCategoryItems[index].strMeal
                                    : areaApi.allAreas[index].strMeal,
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              width: size.width / 2 - 10,
                              child: Text(
                                categoryApi.firstItemInDropDown == 'Category'
                                    ? categoryApi
                                        .listOfCategoryItems[index].strArea
                                    : areaApi.allAreas[index].strArea,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            // buildContainerForIconButton(
                            //   //TODO:Ihave some problem here
                            //     size,
                            //     context,
                            //     api.firstItemInDropDown == 'Category'
                            //         ? api.listOfCategoryItems[index]
                            //         : Provider.of<AreaApi>(context,
                            //                 listen: false)
                            //             .allAreas[index]),
                          ],
                        ),
                        // SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  itemCount: categoryApi.firstItemInDropDown == 'Category'
                      ? categoryApi.listOfCategoryItems.length
                      : areaApi.allAreas.length,
                ))
          ],
        ),
      ),
    );
  }

//replace here
  Container buildContainerForIconButton(
      Size size, BuildContext context, Meal meal) {
    return Container(
      height: size.height / 6 - 50,
      width: size.width / 35 - 9,
      child: IconButton(
        //this icon need alot of work
        //api.firstItemInDropDown == 'Category'
        icon: Provider.of<FavoriteProvider>(context, listen: false)
                .favoriteList
                .contains(meal)
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
        onPressed: () {
          Provider.of<FavoriteProvider>(context, listen: false)
                  .favoriteList
                  .contains(meal)
              ? Provider.of<FavoriteProvider>(context, listen: false)
                  .favoriteList
                  .remove(meal)
              : Provider.of<FavoriteProvider>(context, listen: false)
                  .favoriteList
                  .add(meal);
        },
        color: Provider.of<FavoriteProvider>(context, listen: false)
                .favoriteList
                .contains(meal)
            ? Colors.red
            : Colors.grey,
      ),
    );
  }
}
