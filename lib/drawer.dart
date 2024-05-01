import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:technews/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technews/controller/theme_controller.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
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
            leading: Icon(Icons.new_releases), // Add an icon
            title: Text('Latest'),
            onTap: () {
              Get.toNamed('/latest');
            },
          ),
          ListTile(
            leading: Icon(Icons.search), // Add an icon
            title: Text('Search'),
            onTap: () {
              Get.toNamed('/search');
            },
          ),
          ListTile(
            leading: Icon(Icons.person), // Add an icon
            title: Text('Profile'),
            onTap: () {
              Get.toNamed('/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings), // Add an icon
            title: Text('Settings'),
            onTap: () {
              Get.toNamed('/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Change Theme'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Change Theme'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GetBuilder<ThemeController>(
                          init: ThemeController(),
                          builder: (controller) => Column(
                            children: ThemeMode.values.map((mode) {
                              return RadioListTile<ThemeMode>(
                                title: Text(mode.toString().split('.').last),
                                value: mode,
                                groupValue: controller.themeMode.value,
                                onChanged: (ThemeMode? mode) {
                                  controller
                                      .changeMode(mode ?? ThemeMode.system);
                                  Navigator.pop(context);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info), // Add an icon
            title: Text('About'),
            onTap: () {
              Get.toNamed('/about');
            },
          ),
          // Add more ListTiles for other menu items
        ],
      ),
    );
  }
}
