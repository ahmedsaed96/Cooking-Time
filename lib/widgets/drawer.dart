import 'package:coocking_time/screens/categoryListScreen.dart';
import 'package:coocking_time/screens/favoriteScreen.dart';
import 'package:coocking_time/screens/homePage.dart';
import 'package:coocking_time/screens/settingScreen.dart';
import 'package:flutter/material.dart';

class CustumDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Coocking Time',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward_ios,
                size: 20.0, color: Colors.grey[400]),
            title: Text('Home Page'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,
                size: 20.0, color: Colors.grey[400]),
            title: Text('Category'),
            leading: Icon(Icons.fastfood),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, CategoryListScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            trailing: Icon(Icons.arrow_forward_ios,
                size: 20.0, color: Colors.grey[400]),
            title: Text('Favorites'),
            onTap: () {
              Navigator.pushReplacementNamed(context, FavoriteScreen.routeName);
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,
                size: 20.0, color: Colors.grey[400]),
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pushNamed(context, SettingScreen.routeName);
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,
                size: 20.0, color: Colors.grey[400]),
            title: Text('About Us'),
            leading: Icon(Icons.info),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, CategoryListScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
