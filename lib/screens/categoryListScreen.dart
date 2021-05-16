import 'package:coocking_time/services/areaApi.dart';
import 'package:coocking_time/widgets/drawer.dart';

import '../constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'categoryMealsDetails.dart';
import '../services/categoryApi.dart';
import '../services/mainApi.dart';
import '../function.dart';

class CategoryListScreen extends StatelessWidget {
  static const String routeName = 'CategoryList';
  // final String imageUrl = Provider.of<CategoryApi>(context).categoryFlag[index];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustumDrawer(),
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Select Meal by',
          style: kStyleSmall,
        ),
        actions: [
          Consumer<CategoryApi>(
            builder: (context, api, _) => Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Row(
                children: [
                  DropdownButton(
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black87),
                    underline: Container(
                      height: 2,
                      color: Colors.orange[300],
                    ),
                    value: api.firstItemInDropDown,
                    items: api.listDropDown,
                    onChanged: (val) {
                      api.changeDropDownMenu(val);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Consumer<CategoryApi>(
        builder: (context, api, _) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.only(left: 10.0),
            height: size.height / 3.7,
            width: size.width,
            child: todayRecipeCard(
              size: size,
              height: 30.0,
              width: 160,
              imageUrl: api.firstItemInDropDown == 'Category'
                  ? api.categoryList[index].strCategoryThumb
                  : api.categoryFlag[index],
              //Provider.of<AreaApi>(context).allArea
              nameofrecipe: api.firstItemInDropDown == 'Category'
                  ? api.categoryList[index].strCategory
                  : Provider.of<AreaApi>(context, listen: false)
                      .allArea[index]
                      .strArea,
              onTap: () {
                api.imageUrlProvider = api.categoryList[index].strCategoryThumb;
                api.myListOfCategoryItems = Provider.of<Api>(context,
                        listen: false)
                    .listOfCategorItems(api.categoryList[index].strCategory);
                Provider.of<AreaApi>(context, listen: false).allAreas =
                    Provider.of<Api>(context, listen: false).listOfAreaItems(
                        Provider.of<AreaApi>(context, listen: false)
                            .allArea[index]
                            .strArea);
                // Provider.of<Api>(context).meals[index].strArea;
                return Navigator.of(context).pushNamed(CategoryMeals.routeName);
              },
            ),
          ),
          itemCount: api.firstItemInDropDown == 'Category'
              ? api.categoryList.length
              : Provider.of<AreaApi>(context, listen: false).allArea.length,
        ),
      ),
    );
  }
}
