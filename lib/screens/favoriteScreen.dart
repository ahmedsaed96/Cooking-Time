import 'package:coocking_time/provider/favoriteProvider.dart';
import 'package:coocking_time/screens/favoriteListDetails.dart';
import 'package:coocking_time/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routeName = 'FavoriteScreen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<FavoriteProvider>(
      builder: (context, provider, _) => Scaffold(
        drawer: CustumDrawer(),
        appBar: AppBar(),
        body: provider.favoriteList.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    provider.imageNetworkUrl =
                        provider.favoriteList[index].strMealThumb;
                    provider.title = provider.favoriteList[index].strMeal;
                    provider.category =
                        provider.favoriteList[index].strCategory;
                    return Navigator.of(context).pushNamed(
                        FavoriteLIstDetailsScreen.routeName,
                        arguments: {
                          'index': index,
                          'element': provider.favoriteList[index],
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Card(
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            height: size.height / 5,
                            width: size.width / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(65.0),
                                image: DecorationImage(
                                  image: NetworkImage(provider
                                      //
                                      .favoriteList[index]
                                      .strMealThumb),
                                )),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 10.0),
                                height: size.height / 6 - 70,
                                width: size.width / 2 - 10,
                                child:
                                    Text(provider.favoriteList[index].strMeal),
                              ),
                              Container(
                                width: size.width / 2 - 10,
                                child: Text(
                                    provider.favoriteList[index].strCategory),
                              ),
                              Container(
                                // height: size.height / 6 - 70,
                                // width: size.width / 35 - 9,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        height: 10.0, width: size.width / 3),
                                    IconButton(
                                        icon: Icon(Icons.delete),
                                        color: Colors.grey,
                                        onPressed: () {
                                          provider.favoriteList.remove(
                                              provider.favoriteList[index]);
                                        })
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      // child: ListTile(
                      //   trailing: IconButton(
                      //     icon: Icon(Icons.delete),
                      //     onPressed: () => provider.favoriteList
                      //         .remove(provider.favoriteList[index]),
                      //   ),
                      //   leading: Image.network(
                      //       provider.favoriteList[index].strMealThumb),
                      //   title: Expanded(
                      //       child: Text(provider.favoriteList[index].strMeal)),
                      //   subtitle: Text(provider.favoriteList[index].strCategory),
                      // ),
                    ),
                  ),
                ),
                itemCount: provider.favoriteList.length,
              )
            : Center(
                child: Text('No Favorite Item Found!'),
              ),
      ),
    );
  }
}
