import 'package:flutter/material.dart';

class CustomDrawer {
  static Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu'),
            margin: EdgeInsets.only(bottom: 4),
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),

          ListTile(
            title: Text('Trending'),
            onTap: () {
              Navigator.pushNamed(context, '/trending');
            },
          ),
          ListTile(
            title: Text('Latest'),
            onTap: () {
              Navigator.pushNamed(context, '/latest');
            },
          ),
          ListTile(
            title: Text('Search'),
            onTap: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          // Add more ListTiles for other menu items
        ],
      ),
    );
  }
}
