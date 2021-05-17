import 'package:coocking_time/provider/favoriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget todayRecipeCard(
    {Size size,
    String imageUrl,
    String nameofrecipe,
    Function onTap,
    double height = 70.0,
    double width = 150.0}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.only(bottom: 10.0),
      margin: EdgeInsets.only(right: 15),
      width: size.width / 2.1,
      height: size.height / 3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromRGBO(89, 82, 90, 0.5),
              ),
              child: Text(
                nameofrecipe,
                style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//TODO:Appbar here
AppBar buildAppBarWithFavoriteIcon(BuildContext context, element) {
  return AppBar(
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: IconButton(
          icon: Provider.of<FavoriteProvider>(context, listen: false)
                  .favoriteList
                  .contains(element)
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          onPressed: () {
            Provider.of<FavoriteProvider>(context, listen: false)
                    .favoriteList
                    .contains(element)
                ? Provider.of<FavoriteProvider>(context, listen: false)
                    .favoriteList
                    .remove(element)
                : Provider.of<FavoriteProvider>(context, listen: false)
                    .favoriteList
                    .add(element);
          },
          color: Provider.of<FavoriteProvider>(context, listen: false)
                  .favoriteList
                  .contains(element)
              ? Colors.red
              : Colors.grey,
        ),
      )
    ],
  );
}
