import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => __SettingsState();
}

class __SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [_getRow(icon1: Icons.notifications_outlined, text: 'Notification', icon2: Icons.chevron_right )],
      ),
    );
  }

Widget _getRow({required IconData icon1, required String text, required IconData icon2}) {
    return Row(
      children: [
        const Divider(
          thickness: 10,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Icon(
              icon1,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 190),
          child: IconButton(
            icon: Icon(
              icon2,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}

