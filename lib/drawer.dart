import 'package:flutter/material.dart';

class CustomDrawer {
  static Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 80,
            child: DrawerHeader(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text('Menu'),
                ],
              ),
              margin: EdgeInsets.only(bottom: 4),
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
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
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            title: Text('Dark Mode'),
            onTap: () {
              // Implement your logic for toggling dark mode
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          // Add more ListTiles for other menu items
        ],
      ),
    );
  }
}
