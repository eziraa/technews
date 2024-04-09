import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

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
        children: [
          _getRow(
              icon1: Icons.notifications_outlined,
              text: 'Notification',
              icon2: FontAwesomeIcons.toggleOn),
          _getRow(
              icon1: Icons.lock_outline,
              text: 'Change Password',
              icon2: Icons.chevron_right),
          _getRow(
              icon1: Icons.location_on,
              text: 'Location',
              icon2: FontAwesomeIcons.toggleOn),
          _getRow(
              icon1: FontAwesomeIcons.moon,
              text: 'Dark mode',
              icon2: FontAwesomeIcons.toggleOn),
          _getRow(
              icon1: Icons.help_outline,
              text: 'Help',
              icon2: Icons.chevron_right),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Entypo.log_out,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Log out',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getRow({
    required IconData icon1,
    required String text,
    required IconData icon2,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(icon1),
            onPressed: () {
              // onPressed action for icon1
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          IconButton(
            icon: Icon(
              icon2,
              color: Colors.black,
            ),
            onPressed: () {
              // onPressed action for icon2
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
